Mechanic.destroy_all
Ride.destroy_all

steve = Mechanic.create!(name: 'Steve', years_experience: 4)
bill = Mechanic.create!(name: 'Bill', years_experience: 6)

the_beast = Ride.create!(name: 'The Beast', thrill_rating: 5, open: true)
the_tower_of_terror = Ride.create!(name: 'The Tower of Terror', thrill_rating: 8, open: false)

# the_beast = steve.rides.create!(name: 'The Beast', thrill_rating: 5, open: true)
# the_tower_of_terror = bill.rides.create!(name: 'The Tower of Terror', thrill_rating: 8, open: false)
