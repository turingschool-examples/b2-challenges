require 'rails_helper'

RSpec.describe 'Professor edit page' do
  before :each do
    ProfessorStudent.destroy_all
    Professor.destroy_all
    Student.destroy_all

    @professor1 = Professor.create!(id:1, name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
  end

  describe "As a visitor," do
    describe "When I visit the professor index," do
      describe "I see the name of each professor and a button to update professor" do
        describe "When I click this link, Then I am taken to a form where I can input a new name, age, and specialty" do
          it "When I click the submit button,Then I am taken back to the professors index where I see that professor has been updated" do
            visit '/professors'

            expect(page).to have_content("Professors")
            expect(page).to have_content(@professor1.name)
            expect(page).to have_button("Update Professor")

            click_button("Update Professor")

            expect(current_path).to eq("/professors/#{@professor1.id}/edit")

            fill_in('Name', with: 'TEST')

            click_on('Update Professor')

            expect(current_path).to eq("/professors")
            expect(page).to have_content('TEST')
          end
        end
      end
    end
  end
end
