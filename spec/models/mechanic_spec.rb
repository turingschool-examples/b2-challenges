require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :mechanics_rides}
    it {should have_many(:rides).through(:mechanics_rides)}
  end

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Thomas Johnson", years_of_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Becky Johnson", years_of_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Carl Johnson", years_of_experience: 3)
  end

  describe 'class methods' do
    describe '#average_years_of_experience' do
      it 'returns average of all mechanics years of experience' do
        expect(Mechanic.average_years_of_experience).to eq(4)
      end
    end
  end
end
