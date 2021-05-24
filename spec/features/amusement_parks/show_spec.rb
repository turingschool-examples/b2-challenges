require "rails_helper"

RSpec.describe 'the amusement_park show' do
  it 'lists all the amusement_parks attributes' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)

    visit "/amusement_parks/#{amusement_park.id}"

    expect(page).to have_content(amusement_park.name)
    expect(page).to have_content(amusement_park.price)
  end

  xit 'shows all the open rides the mechanic is working on by thrill rating' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
    ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '8', open: 'false')
    ride_2 = amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
    ride_3 = amusement_park.rides.create!(name: 'Throttle', thrill_rating: '5', open: 'true')
  end
end
