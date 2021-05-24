Mechanic.destroy_all
Ride.destroy_all


@mechanic_1 = Mechanic.create!(name: "Sam", years_experience: 3)
@mechanic_2 = Mechanic.create!(name: "James", years_experience: 9)

@ride_1 = @mechanic_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)