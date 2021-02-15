require 'rails_helper'

describe Professor, type: :model do
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
  describe 'relationships' do
    it { should have_many :professor_students }
    it { should have_many(:students).through(:professor_students) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe "instance methods" do
    describe "#average_student_age" do
      it "gets the average age of all students associated with professor" do
        expect(@professor.average_student_age).to eq (15)
      end
    end
  end
end
