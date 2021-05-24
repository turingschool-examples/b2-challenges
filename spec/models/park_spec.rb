require 'rails_helper'

RSpec.describe Park, type: :model do
  before (:each) do
    @park_1 = Park.create!(name: 'Elitches', admission_price: 20)

    @ride_1 = @park_1.rides.create(name: 'Scrambler', thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create(name: 'Tea Cups', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create(name: 'Log Ride', thrill_rating: 4, open: false)
    @ride_4 = @park_1.rides.create(name: 'Tower of Doom', thrill_rating: 10, open: true)

    @mechanic_1 = Mechanic.create!(name: "Suzie Q", years_experience: 2)
    @mechanic_2 = Mechanic.create!(name: "Jane Doe", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Barak Obama", years_experience: 6)

    @mechanic_ride_1 = MechanicRide.create!(ride: @ride_1, mechanic: @mechanic_1)
    @mechanic_ride_2 = MechanicRide.create!(ride: @ride_2, mechanic: @mechanic_2)
    @mechanic_ride_3 = MechanicRide.create!(ride: @ride_3, mechanic: @mechanic_3)
    @mechanic_ride_4 = MechanicRide.create!(ride: @ride_4, mechanic: @mechanic_3)
  end

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'instance methods' do
    describe '#rides_ordered_alphabetically' do
      it 'returns all rides for a park ordered alphabetically' do

        expect(@park_1.rides_ordered_alphabetically).to eq([@ride_3, @ride_1, @ride_2, @ride_4])
      end
    end
    describe '#average_thrill_rating' do
      it 'returns the average thrill rating for all rides for a park' do

        expect(@park_1.average_thrill_rating).to eq(6.0)
      end
    end
  end

  describe 'class methods' do
  end
end
