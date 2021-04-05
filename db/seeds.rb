# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kara = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
alex = Mechanic.create!(name: 'Alex Potter', years_of_experience: 17)
brian = Mechanic.create!(name: 'Brian Simpson', years_of_experience: 2)

the_hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
spider_man = Ride.create!(name: 'Spider Man', thrill_rating: 9, open: true)
twin_dragons = Ride.create!(name: 'Twin Dragons', thrill_rating: 10, open: true)

Ride_Mechanic_1 = RideMechanics.create!(mechanic: kara, ride: the_hurler)
Ride_Mechanic_2 = RideMechanics.create!(mechanic: kara, ride: twin_dragons)
Ride_Mechanic_3 = RideMechanics.create!(mechanic: alex, ride: the_hurler)
Ride_Mechanic_4 = RideMechanics.create!(mechanic: brian, ride: the_hurler)
Ride_Mechanic_5 = RideMechanics.create!(mechanic: brian, ride: spider_man)
Ride_Mechanic_5 = RideMechanics.create!(mechanic: brian, ride: twin_dragons)
