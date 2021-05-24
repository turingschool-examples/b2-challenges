# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AmusementPark.destroy_all
Mechanic.destroy_all
Ride.destroy_all 

yay_world = AmusementPark.create!(name: "Yay World", price: 18.99)

mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
mechanic_2 = Mechanic.create!(name: "Bryan", exp_in_years: 5)

hurler = mechanic_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
viking = mechanic_1.rides.create!(name: "The Viking", thrill_rating: 2, open: true)
teacups = mechanic_1.rides.create!(name: "Spinning Teacup", thrill_rating: 3, open: true)
bouncy_house = mechanic_1.rides.create!(name: "The Bouncy House", thrill_rating: 1, open: false)
haunted_house = mechanic_2.rides.create!(name: "Haunted House", thrill_rating: 10, open: true)
fun_house = mechanic_2.rides.create!(name: "Fun House", thrill_rating: 1, open: true)
twister = mechanic_2.rides.create!(name: "Twister", thrill_rating: 12, open: true)