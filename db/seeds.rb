# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Professor.destroy_all
Student.destroy_all
professor_1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
student_1 = Student.create!(name: "Neville Shortbottom",age: 22)
professor_1.students << student_1