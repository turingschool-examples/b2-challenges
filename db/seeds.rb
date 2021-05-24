mechanic_1 = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
mechanic_2 = Mechanic.create!(name: 'Darrel Smith', years_experience: 5)
ride_1 = Ride.create!(name: "Whip Around", thrill_rating: 6, open: true)
ride_2 = Ride.create!(name: "Whiz Bang", thrill_rating: 8, open: false)
ride_3 = Ride.create!(name: "Wowza!", thrill_rating: 9, open: true)

mechanic_1.rides << ride_1
mechanic_1.rides << ride_2
mechanic_1.rides << ride_3