require 'rails_helper'

RSpec.describe 'Professor index page' do
  before :each do
    ProfessorStudent.destroy_all
    Professor.destroy_all
    Student.destroy_all

    @professor1 = Professor.create!(id:1, name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
  end

  describe "As a visitor," do
    describe "When I visit the professor index," do
      it "I see the name of each professor" do
        visit '/professors'

        expect(page).to have_content("Professors")
        expect(page).to have_content(@professor1.name)
        expect(page).to have_button("Update Professor")
      end
    end
  end
end
