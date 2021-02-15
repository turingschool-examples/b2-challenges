# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mine = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
dumb = Professor.create!(name: 'Albus Dumbledore', age: 345, specialty: 'Hubris')

nevi = Student.create!(name: 'Neville Longbottom', age: 17)
luna = Student.create!(name: 'Luna Lovegood', age: 17)
cho  = Student.create!(name: 'Cho Chang', age: 18)
