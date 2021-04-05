# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@mechanic_1 = Mechanic.create!(name: "Joey", years: 6)
@mechanic_2 = Mechanic.create!(name: "Bobby", years: 14)
@mechanic_3 = Mechanic.create!(name: "Annie", years: 23)

@ride1 = Ride.create!(name: "Tower of Doom", rating: 9, open: true)
@ride2 = Ride.create!(name: "Roller Coaster", rating: 7, open: true)
@ride3 = Ride.create!(name: "Batman", rating: 10, open: false)
@ride4 = Ride.create!(name: "Teacups", rating: 4, open: false)
@ride5 = Ride.create!(name: "Kiddy ride", rating: 2, open: true)

MechanicRide.create!(mechanic: @mechanic_1, ride: @ride1)
MechanicRide.create!(mechanic: @mechanic_1, ride: @ride2)
MechanicRide.create!(mechanic: @mechanic_1, ride: @ride3)
MechanicRide.create!(mechanic: @mechanic_2, ride: @ride3)
MechanicRide.create!(mechanic: @mechanic_3, ride: @ride3)
MechanicRide.create!(mechanic: @mechanic_3, ride: @ride1)
MechanicRide.create!(mechanic: @mechanic_3, ride: @ride4)
