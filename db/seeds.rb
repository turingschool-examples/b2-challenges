Mechanic.destroy_all
Ride.destroy_all

anna = Mechanic.create!(name: 'Anna Allen', years_experience: 9)
bradley = Mechanic.create!(name: 'Bradley Driver', years_experience: 10)
chelsey = Mechanic.create!(name: 'Chelsey Vise', years_experience: 11)

wizzer = Ride.create!(name: 'Wizzer', thrill_rating: 2, ride_open: true)
bumper_cars = Ride.create!(name: 'Bumper Cars', thrill_rating: 4, ride_open: true)
zoomy = Ride.create!(name: 'Zoomy Death Plunge', thrill_rating: 10, ride_open: true)
no_brakes = Ride.create!(name: 'Brakeless Rusty Coaster', thrill_rating: 8, ride_open: false)
