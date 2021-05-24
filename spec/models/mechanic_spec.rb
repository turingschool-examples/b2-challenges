require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before (:each) do
    @mechanic_1 = Mechanic.create!(name: "Suzie Q", years_experience: 2)
    @mechanic_2 = Mechanic.create!(name: "Jane Doe", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Barak Obama", years_experience: 6)
  end


  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
    describe '#average_experience' do
      it 'returns the average of all years of experience' do

        expect(Mechanic.average_experience).to eq(4)
      end
    end
  end
end
