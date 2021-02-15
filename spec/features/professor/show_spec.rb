require 'rails_helper'

RSpec.describe "professors show page" do
  before :each do
    @professor1 = Professor.create!(name: "professor 1", age: 45, specialty: "Magic")
    @professor2 = Professor.create!(name: "professor 2", age: 30, specialty: "Math")

    @student1 = Student.create!(name: "Student 1", age: 15)
    @student2 = Student.create!(name: "Student 2", age: 16)
    @student3 = Student.create!(name: "Student 3", age: 17)
    @student4 = Student.create!(name: "Student 4", age: 18)

    @pro1_stu1 = ProfessorStudent.create!(professor: @professor1, student: @student1)
    @pro1_stu3 = ProfessorStudent.create!(professor: @professor1, student: @student3)
    @pro1_stu4 = ProfessorStudent.create!(professor: @professor1, student: @student4)
    @pro2_stu1 = ProfessorStudent.create!(professor: @professor2, student: @student1)
    @pro2_stu2 = ProfessorStudent.create!(professor: @professor2, student: @student2)
    @pro2_stu3 = ProfessorStudent.create!(professor: @professor2, student: @student3)
  end

  describe "when I visit the professors show page" do
    it "shows the professors info" do

      visit "professors/#{@professor1.id}"

      within("#professor_info") do
        expect(page).to have_content(@professor1.name)
        expect(page).to have_content(@professor1.age)
        expect(page).to have_content(@professor1.specialty)
      end

      within("#student_info") do
        expect(page).to have_content(@student1.name)
        expect(page).to_not have_content(@student2.name)
        expect(page).to have_content(@student3.name)
        expect(page).to have_content(@student4.name)
      end
    end
  end
end
