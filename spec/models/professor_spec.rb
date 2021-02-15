require 'rails_helper'

RSpec.describe Professor, type: :model do
  before :each do
    @mcgonagall = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @bobby = @mcgonagall.students.create!(name: 'Bobby Hill', age: 15)
    @wesley = @mcgonagall.students.create!(name: 'Wesley Crusher', age: 21)
  end

  describe 'relationships' do
    it { should have_many :professor_students }
    it { should have_many(:students).through(:professor_students) }
  end

  describe 'instance methods' do
    it '#average_student_age, result whole number' do
      expect(@mcgonagall.average_student_age).to eq(18)
    end

    it '#average_student_age, result decimal' do
      @wesley.update(age: 22)
      expect(@mcgonagall.average_student_age).to eq(18.5)
    end
  end
end
