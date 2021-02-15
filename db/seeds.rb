# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Professor.destroy_all
Student.destroy_all

snape = Professor.create!(name: "Severus Snape", age: 60, speciality: "Defense Against the Dark Arts")
slughorn = Professor.create!(name: "Horace Slughorn", age: 70, speciality: "Potions")
harry = Student.create!(name: "Harry Potter", age: 16)
ron = Student.create!(name: "Ron Weasley", age: 16)
hermione = Student.create!(name: "Hermione Granger", age: 16)
draco = Student.create!(name: "Draco Malfoy", age: 16)

ProfessorStudent.create!(professor: snape, student: harry)
ProfessorStudent.create!(professor: slughorn, student: harry)
ProfessorStudent.create!(professor: snape, student: draco)
ProfessorStudent.create!(professor: snape, student: ron)
ProfessorStudent.create!(professor: snape, student: hermione)
ProfessorStudent.create!(professor: slughorn, student: hermione)
