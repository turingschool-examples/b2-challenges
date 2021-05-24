# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all
Ride.destroy_all


Bobby= Mechanic.create!(name: "Bobby", years_experience: 5)
Greg = Mechanic.create!(name: "Greg", years_experience: 10)
James = Mechanic.create!(name: "James", years_experience: 3)
Derris = Mechanic.create!(name: "Derris", years_experience: 1)

mind_eraser = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
boomerang = Ride.create!(name: "Boomerang", thrill_rating: 4, open: false)
side_winder = Ride.create!(name: "Side Winder", thrill_rating: 6, open: false)
twister = Ride.create!(name: "Twister", thrill_rating: 9, open: true)
