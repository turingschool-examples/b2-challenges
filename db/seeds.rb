# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all
Ride.destroy_all


@hurler = Ride.create!(name: 'The Hurler', rating: 7, open: true)
@carousel = Ride.create!(name: 'Magical Carousel', rating: 1, open: false)
@swings = Ride.create!(name: 'Wild Swings', rating: 5, open: true)

@jones = Mechanic.create!(name: 'Pat Jones', experience: 3)
@smith = Mechanic.create!(name: 'Jaime Smith', experience: 5)
