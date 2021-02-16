require 'rails_helper'

describe Professor, type: :model do

  before :each do
    @professor1 = Professor.create(name: "Minerva McGonagall",
                                  age: 204,
                                  specialty: "Transfiguration",
                                  id: 1,
                                  )

    @student1 = Student.create(name: "Harry Potter",
                          age: 30,
                          id: 1,
                          professor_id: 1,
                          )

    @student2 = Student.create(name: "Ron Weasley",
                          age: 28,
                          id: 2,
                          professor_id: 1
                          )

  end

  describe 'relationships' do
    it {should have_many :students}
  end

  describe "instance methods" do
    describe "#total_students" do
      it "returns the total number of students assoicated with the professor" do
        expect(@professor1.total_students).to eq(2)
      end
    end

    describe "#total_students_age" do
      it "returns the total age of students assoicated with the professor" do
        expect(@professor1.total_students_age).to eq(58)
      end
    end

    describe "#average_students_age" do
      it "returns the average age of students assoicated with the professor" do
        expect(@professor1.average_student_age).to eq(29)
      end
    end
  end
end
