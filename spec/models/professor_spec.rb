require 'rails_helper'

describe Professor, type: :model do
  describe 'relationships' do
    it { should have_many :students }
  end

  describe "instance methods" do
    describe "#average_age" do
      it "returns average age of students for specific professor" do
        professor = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        student1 = professor.students.create!(name: "Harry", age: 14)
        student2 = professor.students.create!(name: "Ron", age: 20)

        expect(professor.average_age).to eq(17)
      end
    end
  end
end