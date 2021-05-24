# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MechanicRide.delete_all
Ride.delete_all
Mechanic.delete_all
Park.delete_all

park = Park.create! name: Faker::Color.color_name, price: 10.00

5.times do
  Mechanic.create!(name: Faker::Name.name, years_experience: rand(0..21))
  r = Ride.new(name: Faker::Game.title, thrill_rating: rand(0..11), open: true)
  r.park = park
  r.save!
end

r = Ride.new(name: Faker::Game.title, thrill_rating: rand(0..11), open: false)
r.park = park
r.save!
r = Ride.new(name: Faker::Game.title, thrill_rating: rand(0..11), open: false)
r.park = park
r.save!

