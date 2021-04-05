require 'rails_helper'

RSpec.describe 'the mechanics show page' do
  it 'lists their name, years of experience, and the names of all rides they’re working on' do
    mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 3)
    twister = Ride.find_or_create_by!(name: "Twister", thrill_rating: 4, open: true)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: twister)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content("Twister")
  end

  it 'only shows the rides that are open' do
    mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 3)
    twister = Ride.find_or_create_by!(name: "Twister", thrill_rating: 4, open: true)
    loop = Ride.find_or_create_by!(name: "Loop", thrill_rating: 2, open: false)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: twister)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: loop)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content("Twister")
    expect(page).to have_no_content("Loop")
  end

  it 'lists the rides by thrill rating in descending order' do
    mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 3)
    twister = Ride.find_or_create_by!(name: "Twister", thrill_rating: 4, open: true)
    swing = Ride.find_or_create_by!(name: "Swings", thrill_rating: 2, open: true)
    bender = Ride.find_or_create_by!(name: "Mind Bender", thrill_rating: 5, open: true)
    ferry = Ride.find_or_create_by!(name: "Ferry", thrill_rating: 1, open: true)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: twister)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: swing)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: bender)
    MechanicRide.find_or_create_by!(mechanic: mechanic1, ride: ferry)

    visit "/mechanics/#{mechanic1.id}"

    expect(Ride.ride_order.first).to eq(bender)
    expect(Ride.ride_order.last).to eq(ferry)
  end

  it 'shows a form to add a ride to their workload' do
    mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 3)
    twister = Ride.find_or_create_by!(name: "Twister", thrill_rating: 4, open: true)

    visit "/mechanics/#{mechanic1.id}"

    # fill_in 'number', with: '#{twister.id}', visible: false
    within("#get_form") do
      fill_in "Number", :with => "#{twister.id}"
    end

    expect(page).to have_current_path("/mechanics/#{mechanic1.id}")
    expect(page).to have_content("Twister")
  end
end
