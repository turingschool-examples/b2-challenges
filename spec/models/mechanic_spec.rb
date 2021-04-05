require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @anna = Mechanic.create!(name: 'Anna Allen', years_experience: 9)
    @bradley = Mechanic.create!(name: 'Bradley Driver', years_experience: 10)
    @chelsey = Mechanic.create!(name: 'Chelsey Vise', years_experience: 11)
  end

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    describe '#average years of experience' do
      it 'calculates the average years of experience of all mechanics' do
        expect(Mechanic.avg_exp.to eq(10)
      end
    end
  end
end
