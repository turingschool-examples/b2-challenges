# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all
Ride.destroy_all

bob = Mechanic.create!(name: 'Bob', years_experience: 20)
amy = Mechanic.create!(name: 'Amy', years_experience: 15)
lee = Mechanic.create!(name: 'Lee', years_experience: 10)

hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
spinner = Ride.create!(name: 'The Spinner', thrill_rating: 5, open: true)
elevator = Ride.create!(name: 'The Elevator', thrill_rating: 10, open: true)

RideMechanic.create!(ride: hurler, mechanic:lee)
RideMechanic.create!(ride: hurler, mechanic:amy)
RideMechanic.create!(ride: spinner, mechanic:bob)
