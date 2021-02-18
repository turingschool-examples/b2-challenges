require 'rails_helper'

describe Professor, model: :type do
  describe 'relationships' do
    it {should have_many :students}
  end

  describe 'instance methods' do
    describe '#students_average_age' do
      before :each do
        @professor1 = Professor.create(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        @professor2 = Professor.create(name: "Severus Snape", age: 204, specialty: "Potions")
        @professor3 = Professor.create(name: "Alastor Moody", age: 204, specialty: "Defense Against the Dark Arts")
        @student1 = @professor1.students.create(name: "Harry Potter", age: 17)
        @student2 = @professor1.students.create(name: "Ronald Weasley", age: 17)
        @student3 = @professor2.students.create(name: "Hermione Granger", age: 18)
        @student4 = @professor2.students.create(name: "Neville Longbottom", age: 17)
      end

      it 'returns average age of all students for that professor' do
        expect(@professor1.students_average_age).to eq(0.17e2)
        expect(@professor2.students_average_age).to eq(0.175e2)
        expect(@professor3.students_average_age).to be_nil
      end
    end
  end
end
