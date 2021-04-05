# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

josie = Mechanic.create!(name: 'Josie', years_of_experience: 3)
emmy = Mechanic.create!(name: 'Emmy', years_of_experience: 5)
bella = Mechanic.create!(name: 'Bella', years_of_experience: 1)

ride1 = Ride.create!(name: 'Spooky Coaster', open: true)
ride2 = Ride.create!(name: 'Thrill Factory', open: false)
ride3 = Ride.create!(name: 'Jurrasic Journey', open: true)
