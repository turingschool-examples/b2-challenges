require 'rails_helper'

RSpec.describe ProfessorStudent do
  describe 'relationships' do
    it { should belong_to :professor }
    it { should belong_to :student  }
  end

  describe 'class_methods' do
    it 'returns record that matches a student id' do
      @professor1 = Professor.create!(id: 1, name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
      @student1 = Student.create!(id: 1, name: 'Angel', age: 61)
      professor_student = ProfessorStudent.create!(professor: @professor1, student: @student1)

      expect(ProfessorStudent.find_by(@professor1.id, @student1.id)).to eq(professor_student)
    end
  end
end
