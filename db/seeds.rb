# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all

steve = Mechanic.create!(name: "Steve Brown", years_of_experience: 27)
doug = Mechanic.create!(name: "Doug Wood", years_of_experience: 17)
greg = Mechanic.create!(name: "Greg Marshall", years_of_experience: 10)