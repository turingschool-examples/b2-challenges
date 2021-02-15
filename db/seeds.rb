# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Professor.destroy_all
Student.destroy_all
mulan = Professor.create(name: "Mulan Senior", age: 25, specialty: "Flying")
jen = Professor.create(name: "Emi Star", age: 34, specialty: "Potions")
d = Student.create(name: "Dmytri Nguyen", age: 6)
l = Student.create(name: "Lana Nguyen", age: 4)
k = Student.create(name: "Khoa Nguyen", age: 35)

ProfessorStudent.create(professor: mulan, student: k)
ProfessorStudent.create(professor: mulan, student: l)
ProfessorStudent.create(professor: mulan, student: d)
ProfessorStudent.create(professor: jen, student: l)
ProfessorStudent.create(professor: jen, student: d)
