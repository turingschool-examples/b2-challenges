require 'rails_helper'

describe Professor, type: :model do
  describe 'relationships' do
    it { should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}

    describe 'validations' do
      it {should validate_presence_of :name}
      it {should validate_presence_of :age}
      it {should validate_presence_of :specialty}
    end
  end

  it "average student ages can be gotten" do
    mcgonagall = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    lupin = Professor.create!(name: "Remus Lupin", age: 45, specialty: "Defence Against the Dark Arts")
    snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    harry = Student.create!(name: "Harry Potter", age:14)
    draco = Student.create!(name: "Draco Malfoy", age:18)
    harry_mcgonagall = ProfessorStudent.create!(professor: mcgonagall, student: harry)
    draco_mcgonagall = ProfessorStudent.create!(professor: mcgonagall, student: draco)
    expect(mcgonagall.average_age).to eq(16)

  end
end
