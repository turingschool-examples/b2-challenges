require 'rails_helper'
RSpec.describe Student, type: :model do
  describe "relationships" do
    it {should have_many :student_professors}
    it {should have_many(:professors).through(:student_professors)}
  end

  describe "class methods" do
    it "should be able to calculate average age of students" do
      student1 = Student.create!(name: "Harry", age: 14)
      student2 = Student.create!(name: "Ron", age: 14)
      student3 = Student.create!(name: "Hermionie", age: 14)
      student4 = Student.create!(name: "Fred", age: 15)
      student5 = Student.create!(name: "George", age: 15)
      professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
      professor1.students << student1
      professor1.students << student2
      professor1.students << student3
      professor1.students << student4
      professor1.students << student5
      expect(professor1.students.average_age).to eq(14)

    end
  end
end
