require 'rails_helper'

RSpec.describe MechanicRide, type: :model do
  before (:each) do
    @ride_1 = Ride.create(name: 'Scrambler', thrill_rating: 8, open: true)
    @ride_2 = Ride.create(name: 'Tea Cups', thrill_rating: 2, open: true)
    @ride_3 = Ride.create(name: 'Log Ride', thrill_rating: 4, open: false)
    @ride_4 = Ride.create(name: 'Tower of Doom', thrill_rating: 10, open: true)

    @mechanic_1 = Mechanic.create!(name: "Suzie Q", years_experience: 2)
    @mechanic_2 = Mechanic.create!(name: "Jane Doe", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Barak Obama", years_experience: 6)

    @mechanic_ride_1 = MechanicRide.create!(ride: @ride_1, mechanic: @mechanic_1)
    @mechanic_ride_2 = MechanicRide.create!(ride: @ride_2, mechanic: @mechanic_2)
    @mechanic_ride_3 = MechanicRide.create!(ride: @ride_3, mechanic: @mechanic_3)
    @mechanic_ride_4 = MechanicRide.create!(ride: @ride_4, mechanic: @mechanic_3)
  end

  describe 'relationships' do
    it {should belong_to :ride}
    it {should belong_to :mechanic}
  end

  describe 'class methods' do
  end
end