# require 'rails_helper'
#
# RSpec.describe 'As a visitor' do
#   describe "When I go to a Parks show page" do
#
#     before :each do
#       @park_1 = Park.create!(name: "Lakeside", price: "10.00")
#       @park_2 = Park.create!(name: "Elitches", price: "29.99")
#
#
#       @mechanic_1 = Mechanic.create!(name: "Joey", years: 6)
#       @mechanic_2 = Mechanic.create!(name: "Bobby", years: 14)
#       @mechanic_3 = Mechanic.create!(name: "Annie", years: 23)
#
#       @ride1 = Ride.create!(name: "Tower of Doom", rating: 8, open: true)
#       @ride2 = Ride.create!(name: "Chipmunk", rating: 9, open: true)
#       @ride3 = Ride.create!(name: "Spider Ride", rating: 7, open: false)
#       @ride4 = Ride.create!(name: "Teacups", rating: 4, open: true)
#       @ride5 = Ride.create!(name: "Kiddy ride", rating: 2, open: true)
#
#       MechanicRide.create!(mechanic: @mechanic_1, ride: @ride1)
#       MechanicRide.create!(mechanic: @mechanic_1, ride: @ride2)
#       MechanicRide.create!(mechanic: @mechanic_1, ride: @ride3)
#       MechanicRide.create!(mechanic: @mechanic_2, ride: @ride3)
#       MechanicRide.create!(mechanic: @mechanic_3, ride: @ride3)
#       MechanicRide.create!(mechanic: @mechanic_3, ride: @ride1)
#       MechanicRide.create!(mechanic: @mechanic_3, ride: @ride4)
#       visit "/parks/#{@park_1.id}"
#     end
#
#     it "shows a name and price of admissions for that amusement park" do
#       within("#park-#{@park_1.id}") do
#         expect(page).to have_content(@park_1.name)
#         expect(page).to have_content(@park_1.price)
#         expect(page).not_to have_content(@park_2.name)
#       end
#     end
#   end
# end
