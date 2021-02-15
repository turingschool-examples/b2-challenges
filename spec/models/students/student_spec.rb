require "rails_helper"

RSpec.describe Student, type: :model do
  describe "relationships" do
    it { should have_many(:professors).through(:professor_students)}
    it { should have_many :professor_students }
  end
  describe "class methods" do
    it 'average_student_age' do
      snape = Professor.create!(name: "Severus Snape", age: 60, speciality: "Defense Against the Dark Arts")
      harry = Student.create!(name: "Harry Potter", age: 17)
      ron = Student.create!(name: "Ron Weasley", age: 16)
      draco = Student.create!(name: "Draco Malfoy", age: 15)
      ProfessorStudent.create!(professor: snape, student: harry)
      ProfessorStudent.create!(professor: snape, student: draco)

      expect(snape.students.average_student_age).to eq(16.0)
    end
  end
end
