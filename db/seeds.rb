Mechanic.destroy_all


@mechanic_1 = Mechanic.create!(name: "Sam", years_experience: 3)
@mechanic_2 = Mechanic.create!(name: "James", years_experience: 9)

# @ride_1 = @mechanic_1.ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
# @ride_1 = @mechanic_2.ride.create!(name: 'The Flyer', thrill_rating: 7, open: true)