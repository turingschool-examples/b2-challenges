require 'rails_helper'

RSpec.describe Student, type: :model do
  before :each do
    @professor1 = Professor.create!(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")
    @student1 = @professor1.students.create!(name: "Harry",
                                             age: 18)
    @student2 = @professor1.students.create!(name: "Ron",
                                             age: 20)
    @student3 = @professor1.students.create!(name: "Hermione",
                                             age: 16)
  end

  describe "relationships" do
    it { should have_many :professor_students}
    it { should have_many(:professors).through(:professor_students)}
  end

  describe 'class methods' do
    it 'can find average age of students' do
      expect(Student.average_age). to eq(18)
    end
  end
end
