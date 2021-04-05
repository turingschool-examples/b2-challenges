require 'rails_helper'

RSpec.describe Mechanic, type: :model do

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe '.average_exp' do
    it " returns the average experiance of all mechanics" do
      mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)
      mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)

      expect(Mechanic.average_exp).to eq(15.5)

    end
  end

  describe '.open_rides' do
    it " list of all open rides" do

      mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)

      ride_1 = Ride.create!(name: "ride_1", thrill_rateing: 1, open: true)
      ride_2 = Ride.create!(name: "ride_2", thrill_rateing: 2, open: true)
      ride_3 = Ride.create!(name: "ride_3", thrill_rateing: 3, open: false)
      ride_4 = Ride.create!(name: "ride_4", thrill_rateing: 4, open: false)

      mechanic_ride_1a = MechanicRide.create!(ride: ride_1, mechanic: mechanic_1)
      mechanic_ride_1b = MechanicRide.create!(ride: ride_2, mechanic: mechanic_1)
      mechanic_ride_1c = MechanicRide.create!(ride: ride_3, mechanic:  mechanic_1)
      mechanic_ride_1d = MechanicRide.create!(ride: ride_4, mechanic: mechanic_1)

      expect(mechanic_1.open_rides).to eq([ride_1, ride_2])
    end
  end


end
