# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
mechanic_2 = Mechanic.create!(name: 'John Doe', years_experience: 5)

ride_1 = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
ride_2 = Ride.create!(name: 'Free Fall', thrill_rating: 9, open: true)
ride_3 = Ride.create!(name: 'Big Splash', thrill_rating: 3, open: true)

RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)
RideMechanic.create!(ride: ride_2, mechanic: mechanic_1)
RideMechanic.create!(ride: ride_2, mechanic: mechanic_2)
RideMechanic.create!(ride: ride_3, mechanic: mechanic_2)
