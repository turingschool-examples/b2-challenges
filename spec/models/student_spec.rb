require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

    describe 'class methods' do
    it '.average_age' do

     professor1 = Professor.create!(name: 'Mr. Potter', age: 300, specialty: 'Transfiguration')
     professor2 = Professor.create!(name: 'Mrs. Kat', age: 400, specialty: 'Potions')

     harry = Student.create!(name: "Harry Potter", age: 10)
     ron = Student.create!(name: "Ron Hogwarts", age: 12)
     granger = Student.create!(name: "Granger Hogwarts", age: 14)

     ProfessorStudent.create!(professor_id: professor1.id, student_id: harry.id)
     ProfessorStudent.create!(professor_id: professor2.id, student_id: ron.id)
     ProfessorStudent.create!(professor_id: professor2.id, student_id: granger.id)

     expect(Student.average_age).to eq(12)
   end
 end
end
