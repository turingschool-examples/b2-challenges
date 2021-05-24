# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.create!(name: 'Tina', years_experience: 12)
amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
amusement_park.rides.create!(name: 'Twister', thrill_rating: '8', open: 'false')
amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
amusement_park.rides.create!(name: 'Throttle', thrill_rating: '5', open: 'true')
