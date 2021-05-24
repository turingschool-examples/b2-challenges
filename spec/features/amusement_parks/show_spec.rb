require "rails_helper"

RSpec.describe 'the amusement_park show' do
  it 'lists all the amusement_parks attributes' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)

    visit "/amusement_parks/#{amusement_park.id}"

    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.price)
  end

  it 'shows all the rides by thrill rating' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
    ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '3', open: 'false')
    ride_2 = amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
    ride_3 = amusement_park.rides.create!(name: 'Throttle', thrill_rating: '8', open: 'true')

    visit "/amusement_parks/#{amusement_park.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(ride_3.name).to appear_before(ride_1.name)
  end

  it 'shows all average thrill rate of rides' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
    ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '3', open: 'false')
    ride_2 = amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
    ride_3 = amusement_park.rides.create!(name: 'Throttle', thrill_rating: '8', open: 'true')

    visit "/amusement_parks/#{amusement_park.id}"

    expect(page).to have_content('4.3/10')

  end
end
