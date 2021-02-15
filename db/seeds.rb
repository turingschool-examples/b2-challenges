# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Professor.destroy_all

professor1 = Professor.create!(name: "Professor Snape", age: 65, specialty: "Magic")
professor2 = Professor.create!(name: "Professor Minerva McGonagall", age: 204, specialty: "Transfiguration")
professor3 = Professor.create!(name: "Professor Orf", age: 30, specialty: "Levitating")

student1 = professor1.students.create!(name: "Harry", age: 17)
student2 = professor1.students.create!(name: "Ron", age: 15)
student3 = professor3.students.create!(name: "Herminie", age: 14)
