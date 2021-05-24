require "rails_helper"

RSpec.describe 'the mechanic show' do
  it 'lists all the mechanics attributes' do
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
  end

  it 'shows all the open rides the mechanic is working on by thrill rating' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)
    ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '8', open: 'false')
    ride_2 = amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
    ride_3 = amusement_park.rides.create!(name: 'Throttle', thrill_rating: '5', open: 'true')
    RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)
    RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)
    RideMechanic.create!(mechanic: mechanic_1, ride: ride_3)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to_not have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(ride_3.name).to appear_before(ride_2.name)
  end

  it 'can add a ride to the mechanics worklist' do
    amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)
    ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '8', open: 'true')

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to_not have_content(ride_1.name)
    expect(find('form')).to have_content('Ride Id:')
    fill_in('Ride Id:', with: "#{ride_1.id}")
    click_button('Submit')

    expect(page).to have_current_path("/mechanics/#{mechanic_1.id}")
    expect(page).to have_content(ride_1.name)
  end
end
