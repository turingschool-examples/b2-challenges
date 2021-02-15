require 'rails_helper'

RSpec.describe Student do
  describe 'relationships' do
    it { should have_many :professor_students }
    it { should have_many(:professors).through(:professor_students) }
  end

  describe 'class methods' do
    it 'returns average age' do
      student1 = Student.create!(name: 'Angel', age: 61)
      student2 = Student.create!(name: 'Chris', age: 86)

      expected = (student1.age + student2.age)/2.0
      expect(Student.average_age).to eq(expected)
    end
  end
end
