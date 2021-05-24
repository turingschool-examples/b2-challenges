Mechanic.destroy_all
Ride.destroy_all


@mechanic_1 = Mechanic.create!(name: "Sam", years_experience: 3)
@mechanic_2 = Mechanic.create!(name: "James", years_experience: 9)

@ride_1 = @mechanic_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
@ride_2 = @mechanic_1.rides.create!(name: 'The Spinster', thrill_rating: 3, open: true)
@ride_3 = @mechanic_1.rides.create!(name: 'The Flyer', thrill_rating: 5, open: true)
@ride_4 = @mechanic_2.rides.create!(name: 'The Abyss', thrill_rating: 5, open: false)
@ride_5 = @mechanic_2.rides.create!(name: 'The Banshee', thrill_rating: 9, open: true)
@ride_6 = @mechanic_2.rides.create!(name: 'The Screamer', thrill_rating: 7, open: true)