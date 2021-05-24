# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Mechanic.create(name: Faker::Name.name, years_experience: rand(1..15))
end

10.times do
  Ride.create(name: Faker::Superhero.name, thrill_rating: rand(1..5), open: Faker::Boolean.boolean)
end
