# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mechanic1 = Mechanic.create!(name: 'Kara', years_experience: 11)
mechanic2 = Mechanic.create!(name: 'James', years_experience: 5)


ride1 = Ride.create!(name: 'Scrambler', thrill_rating: 5, open: false)
ride2 = Ride.create!(name: 'Nitro', thrill_rating: 10, open: false)
ride3 = Ride.create!(name: 'Zipper', thrill_rating: 3, open: true)
ride4 = Ride.create!(name: 'El Toro', thrill_rating: 8, open: true)
