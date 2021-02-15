require "rails_helper"

RSpec.describe Professor, type: :model do
  describe "relationships" do
    it { should have_many :professor_students }
    it { should have_many(:students).through(:professor_students) }
  end

  describe "instance methods" do
    describe "#average_age_of_students" do
      it "can find average of students ages for a professor" do
        professor = Professor.create!(name: "Professor Snape", age: 65, specialty: "Magic")
        student1 = Student.create!(name: "Harry", age: 17)
        student2 = Student.create!(name: "Ron", age: 15)
        professor_student1 = ProfessorStudent.create!(professor_id: professor.id, student_id: student1.id)
        professor_student2 = ProfessorStudent.create!(professor_id: professor.id, student_id: student2.id)

        expect(professor.average_age_of_students).to eq(16)
      end
    end
  end
end
