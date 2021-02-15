# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@harry = Student.create!(name: "Harry", age: 15)
@ron = Student.create!(name: "Ron", age: 16)
@hermione = Student.create!(name: "Hermione", age: 15)
@draco = Student.create!(name: "Draco", age: 15)
@frodo = Student.create!(name: "Frodo", age: 16)
@marty = Student.create!(name: "Marty", age: 24)
@samwise = Student.create!(name: "Samwise", age: 13)

@snape = Professor.create!(name: "Snape", age: 56, specialty: "Potions")
@lupin = Professor.create!(name: "Lupin", age: 60, specialty: "Defense")
@hagrid = Professor.create!(name: "Hagrid", age: 45, specialty: "Gamekeeper")

