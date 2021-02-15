require 'rails_helper'

RSpec.describe 'Professor show page' do
  before :each do
    Professor.destroy_all
    Student.destroy_all
    ProfessorStudent.destroy_all

    @professor = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @harry = Student.create!(name: 'Harry Potter', age: 14)
    @hermione = Student.create!(name: 'Hermione Granger', age: 16)
    @professor_student1 = ProfessorStudent.create!(professor_id: @professor.id, student_id: @harry.id)
    @professor_student2 = ProfessorStudent.create!(professor_id: @professor.id, student_id: @hermione.id)
  end

  describe "As a visitor," do
    describe "When I visit a professor show page," do
      it "Then I see that professor's name, age, and specialty" do
        visit "/professors/#{@professor.id}"

        expect(page).to have_content("Name: #{@professor.name}")
        expect(page).to have_content("Age: #{@professor.age}")
        expect(page).to have_content("Specialty: #{@professor.specialty}")
      end

      it "And I see the names of all students associated with this professor" do
        visit "/professors/#{@professor.id}"

        expect(page).to have_content("Students:")
        expect(page).to have_content(@harry.name)
        expect(page).to have_content(@hermione.name)
      end

      it "Then I see the average age of all students associated with this professor" do
        visit "/professors/#{@professor.id}"

        expect(page).to have_content("Average Student Age: 15")
      end
    end
  end
end
