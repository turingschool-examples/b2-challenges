require 'rails_helper'
describe Student, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
  end

  describe "Relationship" do
    it { should have_many :professor_students}
    it { should have_many(:professors).through(:professor_students) }
  end

  describe 'Class methods' do
    describe ':: it_finds_average_age' do
      it 'finds average age of students' do
        @student1 = Student.create!(name: "Harry", age: 14)
        @student2 = Student.create!(name: "Hermoine", age: 13)
        @student2 = Student.create!(name: "jeff", age: 12)

        expect(Student.find_average_age).to eq(13)
      end
    end
  end
end
