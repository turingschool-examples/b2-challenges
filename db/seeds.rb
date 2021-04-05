Mechanic.destroy_all
Ride.destroy_all

steve = Mechanic.create!(name: 'Steve', years_experience: 4)
bill = Mechanic.create!(name: 'Bill', years_experience: 6)

steve.rides.create!(name: 'The Beast', thrill_rating: 5, open: true)
bill.rides.create!(name: 'The Tower of Terror', thrill_rating: 8, open: false)
