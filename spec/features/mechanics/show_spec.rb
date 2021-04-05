require 'rails_helper'

describe 'mechanic show page' do
  it 'shows name, exp, all ride names that are open and in order of thrill desc' do
    ride_1 = Ride.create!(name: 'fast', thrill_rating: 5, open: true)
    ride_2 = Ride.create!(name: 'medium', thrill_rating: 3, open: false)
    ride_3 = Ride.create!(name: 'slow', thrill_rating: 7, open: true)
    mech_1 = Mechanic.create!(name: 'bob', years_experience: 10)

    mech_1.rides << [ride_1, ride_2, ride_3]

    visit "/mechanics/#{mech_1.id}"

    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_experience)

    expect(ride_3.name).to appear_before(ride_1.name)

    expect(page).to_not have_content(ride_2.name)
  end

  it 'add a ride to a mechanic' do
    ride_1 = Ride.create!(name: 'fast', thrill_rating: 5, open: true)
    ride_3 = Ride.create!(name: 'slow', thrill_rating: 7, open: true)
    mech_1 = Mechanic.create!(name: 'bob', years_experience: 10)

    visit "/mechanics/#{mech_1.id}"

    expect(page).to_not have_content(ride_1.name)

    fill_in "ride_id", with: ride_1.id
    click_on "Submit"

    expect(page).to have_content(ride_1.name)
  end
end