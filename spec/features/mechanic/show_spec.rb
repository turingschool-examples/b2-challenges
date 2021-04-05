require 'rails_helper'

RSpec.describe "Mechanic show page", type: :feature do
 describe 'when I visit the mechanic show page' do
  it 'I can see a list of all the rides each mechanic is working on and those rides must be open' do
    mech1 = Mechanic.create!(
      name: "Bob",
      years_experience: 12
    )
    mech2 = Mechanic.create!(
      name: "Bobette",
      years_experience: 15
    )
    ride1 = Ride.create!(
      name: "Holy Terror of Babel",
      thrill_rating: 8,
      open: true
    )
    ride2 = Ride.create!(
      name: "REGRETABLE9000",
      thrill_rating: 2,
      open: true
    )
    ride3 = Ride.create!(
      name: "No More Limbs",
      thrill_rating: 4,
      open: true
    )
    ride4 = Ride.create!(
      name: "Last Will and Testament",
      thrill_rating: 3,
      open: false
    )
    mech1.rides << ride1
    mech1.rides << ride2
    mech2.rides << ride3
    mech2.rides << ride4

    visit "/mechanics/#{mech1.id}"

    expect(page).to have_content("Holy Terror of Babel")
    expect(page).to have_content("REGRETABLE9000")

    visit "/mechanics/#{mech2.id}"

    expect(page).to have_content("No More Limbs")
  end

  it 'has form to add ride id to mechanic workload and redirects back to index page' do
    mech1 = Mechanic.create!(
      name: "Bob",
      years_experience: 12
    )
    ride1 = Ride.create!(
      name: "Holy Terror of Babel",
      thrill_rating: 8,
      open: true
    )
    ride2 = Ride.create!(
      name: "REGRETABLE9000",
      thrill_rating: 2,
      open: true
    )
    ride3 = Ride.create!(
      name: "No More Limbs",
      thrill_rating: 4,
      open: true
    )
    mech1.rides << ride1
    mech1.rides << ride2

    visit "/mechanics/#{mech1.id}"

    fill_in 'ride_id', with: ride3.id

    click_on 'Add Ride to Mechanic Workload'
    expect(current_path).to eq("/mechanics/#{mech1.id}")

    expect(page).to have_content("Holy Terror of Babel")
    expect(page).to have_content("REGRETABLE9000")
    expect(page).to have_content("No More Limbs")
    end
  end
end
