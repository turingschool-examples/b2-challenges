# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Mechanic.create!(name: Faker::Name.name, years_experience: rand(0..21))
  Ride.create!(name: Faker::Game.title, thrill_rating: rand(0..11), open: true)
end

Ride.create!(name: Faker::Game.title, thrill_rating: rand(0..11), open: false)
Ride.create!(name: Faker::Game.title, thrill_rating: rand(0..11), open: false)