# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all
Ride.destroy_all

@mechanic1 = Mechanic.create!(name: "Bob Jones", years_experience: 12)
@mechanic2 = Mechanic.create!(name: "Sally Fields", years_experience: 23)
@mechanic3 = Mechanic.create!(name: "Sal Junior", years_experience: 4)
