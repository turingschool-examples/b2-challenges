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

@ride1 = @mechanic1.rides.create!(name: "Twirl-a-whirl", thrill_rating: 7, open: true)
@ride2 = @mechanic1.rides.create!(name: "Teacups", thrill_rating: 3, open: true)
@ride3 = @mechanic1.rides.create!(name: "Skull Mountain", thrill_rating: 9, open: false)

@ride4 = @mechanic2.rides.create!(name: "Tazmanian Devil", thrill_rating: 7, open: true)
@ride5 = @mechanic2.rides.create!(name: "Log Flume", thrill_rating: 3, open: true)
@ride6 = @mechanic2.rides.create!(name: "Batman and Robin", thrill_rating: 9, open: false)
