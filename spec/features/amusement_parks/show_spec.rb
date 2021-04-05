require 'rails_helper'

describe 'amusement park show page' do
  it 'shows name, price, all ride names in alphabettical order, avg thrill rating' do
    ride_1 = Ride.create!(name: 'fast', thrill_rating: 5, open: true)
    ride_2 = Ride.create!(name: 'medium', thrill_rating: 3, open: false)
    ride_3 = Ride.create!(name: 'slow', thrill_rating: 7, open: true)
    park_1 = AmusementPark.create!(name: 'bob', price: 50)

    park_1.rides << [ride_1, ride_2, ride_3]

    visit "/amusement_parks/#{park_1.id}"

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_1.price)

    expect(ride_1.name).to appear_before(ride_2.name)

    expect(page).to have_content(5.0)
  end
end