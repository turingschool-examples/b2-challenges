# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all
Ride.destroy_all
mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
mechanic_2 = Mechanic.create(name: 'Johnny Bee', years_experience: 6)
mechanic_3 = Mechanic.create(name: 'Molly Lee', years_experience: 5)
whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)
