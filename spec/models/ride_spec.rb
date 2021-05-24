require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe 'class method' do
    it 'can return rides that are open' do
      ride_1 = Ride.create!(name: 'Rockin Roller Coaster', thrill_rating: 8, open: true)
      ride_2 = Ride.create!(name: 'Tower of Terror', thrill_rating: 9, open: true)
      ride_3 = Ride.create!(name: 'Teacup Ride', thrill_rating: 2, open: false)

      expect(Ride.is_open?).to eq([ride_1, ride_2])
      expect(Ride.is_open?).to_not eq(ride_3)
    end

    it 'can order rides by descending thrill rating' do
      ride_1 = Ride.create!(name: 'Rockin Roller Coaster', thrill_rating: 8, open: true)
      ride_2 = Ride.create!(name: 'Tower of Terror', thrill_rating: 9, open: true)
      ride_3 = Ride.create!(name: 'Teacup Ride', thrill_rating: 2, open: false)

      expect(Ride.thrill).to_not eq([ride_1, ride_2, ride_3])
      expect(Ride.thrill).to eq([ride_2, ride_1, ride_3])
    end
  end
end
