require "rails_helper"

RSpec.describe 'the mechanic show' do
  it 'lists all the mechanics attributes' do
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
  end
  it 'shows all the open rides the mechanic is working on by thrill rating' do
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)
    ride_1 = Ride.create!(name: 'Twister', thrill_rating: '8', open: 'false')
    ride_2 = Ride.create!(name: 'Winder', thrill_rating: '2', open: 'true')
    ride_3 = Ride.create!(name: 'Throttle', thrill_rating: '5', open: 'true')
    RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)
    RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)
    RideMechanic.create!(mechanic: mechanic_1, ride: ride_3)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to_not have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(ride_3.name).to appear_before(ride_2.name)
  end
end
