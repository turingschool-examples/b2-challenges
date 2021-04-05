# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all
Ride.destroy_all
MechanicRide.destroy_all

mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)
mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)
mechanic_3 = Mechanic.create!(name: "roberta", experiance: 5)


ride_1 = Ride.create!(name: "ride_1", thrill_rateing: 1, open: true)
ride_2 = Ride.create!(name: "ride_2", thrill_rateing: 2, open: true)
ride_3 = Ride.create!(name: "ride_3", thrill_rateing: 3, open: false)
ride_4 = Ride.create!(name: "ride_4", thrill_rateing: 4, open: false)


mechanic_ride_1a = MechanicRide.create!(ride: ride_1, mechanic: mechanic_1)
mechanic_ride_1b = MechanicRide.create!(ride: ride_2, mechanic: mechanic_1)
mechanic_ride_2b = MechanicRide.create!(ride: ride_2, mechanic: mechanic_2)
mechanic_ride_2d = MechanicRide.create!(ride: ride_4, mechanic: mechanic_2)
mechanic_ride_3c = MechanicRide.create!(ride: ride_3, mechanic:  mechanic_3)
mechanic_ride_3d = MechanicRide.create!(ride: ride_4, mechanic: mechanic_3)
