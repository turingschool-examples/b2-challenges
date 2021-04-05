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

    @ride_1 = @mechanic_1.rides.create!(name: "Top Thrill", thrill_rating: 55, open: true)
    @ride_2 = @mechanic_1.rides.create!(name: "Magnum", thrill_rating: 100, open: false)
  end

  describe 'class methods' do
    describe '#average_years_of_experience' do
      it 'returns average of all mechanics years of experience' do
        expect(Mechanic.average_years_of_experience).to eq(4)
      end
    end
  end

  describe 'instance methods' do
    describe '#ordered_ride_names' do
      it 'returns all ride names a mechanic is working on in alphabetical order' do
        expect(@mechanic_1.ordered_ride_names).to eq(["#{@ride_2.name}", "#{@ride_1.name}"])
      end
    end
  end
end
