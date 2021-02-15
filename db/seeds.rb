# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@professor1 = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
@professor2 = Professor.create!(name: 'Remus Lupin', age: 204, specialty: 'Defense')
@professor3 = Professor.create!(name: 'Gilderoy Lockhart', age: 204, specialty: 'Defense')
@student1 = @professor1.students.create!(name: 'Angel', age: 61)
@student2 = @professor1.students.create!(name: 'Chris', age: 86)
