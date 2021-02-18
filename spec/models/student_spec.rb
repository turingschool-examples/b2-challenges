require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Relationship" do
    it { should have_many :rolls}
    it { should have_many(:professors).through(:rolls)}
  end

  describe "Class Methods" do
    describe "::average_age" do
      it "calculates the average age of all the students" do
        @snape = Professor.create!(name: "Severaus Snape", age: 43, specialty: "Potions")
      
        @harry = @snape.students.create!(name: "Harry Potter", age: 11 )
        @ron = @snape.students.create!(name: "Ron Weasley", age: 13 )
        @hermione = @snape.students.create!(name: "Hermione Grainger", age: 12 )
      
        expect(Student.average_age).to eq(12)
      end
    end
  end
end
