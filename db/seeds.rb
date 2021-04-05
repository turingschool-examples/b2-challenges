# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all
Ride.destroy_all
MaintenanceLog.destroy_all

mech1 = Mechanic.create!(name: 'John Doe', years_experience: 5)
mech2 = Mechanic.create!(name: 'Jane Doe', years_experience: 9)

ride1 = Ride.create!(name: 'Montu', thrill_rating: 7, open: true)
ride2 = Ride.create!(name: 'Sheikra', thrill_rating: 8, open: false)

MaintenanceLog.create!(mechanic_id: mech1.id, ride_id: ride1.id)
MaintenanceLog.create!(mechanic_id: mech2.id, ride_id: ride1.id)
MaintenanceLog.create!(mechanic_id: mech2.id, ride_id: ride2.id)