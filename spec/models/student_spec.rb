require 'rails_helper'
describe Student, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
  end

  describe "Relationship" do
    it { should have_many :professor_students}
    it { should have_many(:professors).through(:professor_students) }
  end

  describe 'Class methods' do
    describe ':: it_finds_average_age' do
      it 'finds average age of students' do
        @professor = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        @professor = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        @professor = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        @student1 = @professor.students.create!(name: "Harry", age: 14)
        @student2 = @professor.students.create!(name: "Hermoine", age: 13)
        @student3 = @professor.students.create!(name: "jeff", age: 12)
        @harry = ProfessorStudent.create!(professor: @professor, student: @student1)
        @hermoine = ProfessorStudent.create!(professor: @professor, student: @student2)
        @jeff = ProfessorStudent.create!(professor: @professor, student: @student3)

        expect(Student.find_average_age(@professor)).to eq(13)
      end
    end
  end
end
