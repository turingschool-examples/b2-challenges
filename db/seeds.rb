# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mechanic_one = Mechanic.create!(name: 'Samantha West', years_of_experience: 5 )
mechanic_two = Mechanic.create!(name: 'Ken Johnson', years_of_experience: 10 )

ride_one = Ride.create!(name: "Roller Coaster", thrill_rating: 9, is_open: false)
ride_two = Ride.create!(name: "Ferris Wheel", thrill_rating: 1, is_open: false)
