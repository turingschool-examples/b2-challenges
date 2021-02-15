require 'rails_helper'

RSpec.describe 'Professor index page' do
  before :each do
    Professor.destroy_all
    Student.destroy_all
    ProfessorStudent.destroy_all

    @professor1 = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @professor2 = Professor.create!(name: 'Severus Snape', age: 25, specialty: 'Defense Against the Dark Arts')
  end

  describe "As a visitor," do
    describe "When I visit the professor index," do
      it "I see the name of each professor" do
        visit '/professors'

        expect(page).to have_content("Professors")
        expect(page).to have_content(@professor1.name)
        expect(page).to have_content(@professor2.name)
      end
    end
  end
end
