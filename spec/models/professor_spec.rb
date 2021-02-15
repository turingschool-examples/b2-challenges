require 'rails_helper'

RSpec.describe Professor do
  describe 'relationships' do
    it { should have_many :student_professors }
    it { should have_many(:students).through(:student_professors)}
  end

  describe 'instance methods' do
    describe 'professor#average_ages' do
      it 'returns average student ages' do
        mine = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
        nevi = Student.create!(name: 'Neville Longbottom', age: 17)
        luna = Student.create!(name: 'Luna Lovegood', age: 16)
        cho  = Student.create!(name: 'Cho Chang', age: 18)
        mine.students << nevi
        mine.students << luna
        mine.students << cho

        expect(mine.average_ages).to eq(17)
      end
    end
  end
end
