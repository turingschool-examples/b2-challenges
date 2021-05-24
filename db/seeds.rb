# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ride_1 = Ride.create(name: 'Scrambler', thrill_rating: 8, open: true)
ride_2 = Ride.create(name: 'Tea Cups', thrill_rating: 2, open: true)
ride_3 = Ride.create(name: 'Log Ride', thrill_rating: 4, open: false)
ride_4 = Ride.create(name: 'Tower of Doom', thrill_rating: 10, open: true)

mechanic_1 = Mechaninc.create!(name: "Suzie Q", years_experience: 2)
mechanic_2 = Mechaninc.create!(name: "Jane Doe", years_experience: 4)
mechanic_3 = Mechaninc.create!(name: "Barak Obama", years_experience: 6)

mechanic_ride_1 = ApplicationPet.create!(application: ride_1, pet: mechanic_1)
mechanic_ride_2 = ApplicationPet.create!(application: ride_2, pet: mechanic_2)
mechanic_ride_3 = ApplicationPet.create!(application: ride_3, pet: mechanic_3)
mechanic_ride_4 = ApplicationPet.create!(application: ride_4, pet: mechanic_3)