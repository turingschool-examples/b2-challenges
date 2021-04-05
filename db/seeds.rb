# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 3)
twister = Ride.find_or_create_by!(name: "Twister", thrill_rating: 4, open: true)
loop = Ride.find_or_create_by!(name: "Loop", thrill_rating: 2, open: 0)

MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: twister)
