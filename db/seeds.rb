# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all
Ride.destroy_all
MechanicRide.destroy_all

tim = Mechanic.create!(name:'Tim', experience:12)
Mechanic.create!(name:'Sally', experience:16)
Mechanic.create!(name:'Beth', experience: 4)
Mechanic.create!(name:'Derek', experience:8)

scrambler = Ride.create!(name:'Scrambler', open: false, thrill_rating: 5)
rambler = Ride.create!(name:'Rambler', open: true, thrill_rating: 6)
ambler = Ride.create!(name:'Ambler', open: true, thrill_rating: 7)

MechanicRide.create!(mechanic: tim, ride: scrambler)
MechanicRide.create!(mechanic: tim, ride: rambler)
MechanicRide.create!(mechanic: tim, ride: ambler)