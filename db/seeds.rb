# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@professor1 = Professor.create(name: "Minerva McGonagall",
                              age: 204,
                              specialty: "Transfiguration",
                              id: 1,
                              )

@student1 = Student.create(name: "Harry Potter",
                      age: 30,
                      id: 1,
                      professor_id: 1,
                      )

@student2 = Student.create(name: "Ron Weasley",
                      age: 27,
                      id: 2,
                      professor_id: 1
                      )
