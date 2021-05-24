# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jim = Mechanic.create(name:'Jim Bob', years_experience: 2)
ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false)
ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true)
ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true)
thing = RideMechanic.create(mechanic: jim, ride: ride1)
otherthing = RideMechanic.create(mechanic: jim, ride: ride2)
otherotherthing = RideMechanic.create(mechanic: jim, ride: ride3)