require "rails_helper"

describe Ride, type: :model do
   describe "relationships" do
      it {should have_many(:mechanic_rides)}
      it {should have_many(:mechanics).through(:mechanic_rides)}
   end

 describe 'class methods' do
 before :each do
   @mechanic_1 = Mechanic.create!(name: "Joey", years: 6)
   @mechanic_2 = Mechanic.create!(name: "Bobby", years: 14)
   @mechanic_3 = Mechanic.create!(name: "Annie", years: 23)

   @ride1 = Ride.create!(name: "Tower of Doom", rating: 8, open: true)
   @ride2 = Ride.create!(name: "Chipmunk", rating: 9, open: true)
   @ride3 = Ride.create!(name: "Spider Ride", rating: 7, open: false)
   @ride4 = Ride.create!(name: "Teacups", rating: 4, open: true)
   @ride5 = Ride.create!(name: "Kiddy ride", rating: 2, open: true)

   MechanicRide.create!(mechanic: @mechanic_1, ride: @ride1)
   MechanicRide.create!(mechanic: @mechanic_1, ride: @ride2)
   MechanicRide.create!(mechanic: @mechanic_1, ride: @ride3)
   MechanicRide.create!(mechanic: @mechanic_2, ride: @ride3)
   MechanicRide.create!(mechanic: @mechanic_3, ride: @ride3)
   MechanicRide.create!(mechanic: @mechanic_3, ride: @ride1)
   MechanicRide.create!(mechanic: @mechanic_3, ride: @ride4)
 end

 it '::isort_by_most_thrills_and_open' do
   expected = [@ride2, @ride1]
   expect(@mechanic_1.rides.isort_by_most_thrills_and_open).to eq(expected)
   expect(@mechanic_1.rides.isort_by_most_thrills_and_open).to_not eq(@ride3)
   end
 end
end
