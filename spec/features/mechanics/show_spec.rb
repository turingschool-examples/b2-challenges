require 'rails_helper'

RSpec.describe 'Mechanics Index'do
  before(:each) do
    @jane = Mechanic.create(name: "Jane G", years_experience: 2)
    @sherry = Mechanic.create(name: "Sherry S", years_experience: 12)
    @ash = Mechanic.create(name: "Ashley M", years_experience: 10)

    @tower = Ride.create(name: "Tower of Terror", thrill_rating: 5, open: true)
    @rockin = Ride.create(name: "Rockin Roller Coaster", thrill_rating: 4, open: true)
    @starwars = Ride.create(name: "Star Wars Ride", thrill_rating: 3, open: false)

    MechanicRide.create(mechanic_id: @jane.id, ride_id: @tower.id)
    MechanicRide.create(mechanic_id: @jane.id, ride_id: @rockin.id)
    MechanicRide.create(mechanic_id: @jane.id, ride_id: @starwars.id)
  end

  it'I see their name, their years of experience and the rides they are working on' do
    visit "/mechanics/#{@jane.id}"

    expect(page).to have_content(@jane.name)
    expect(page).to have_content(@jane.years_experience)
    expect(page).to have_content("Rides #{@jane.name} is working on:")
    expect(page).to have_content(@tower.name)
    expect(page).to_not have_content(@starwars.name)


    expect(page).to_not have_content(@sherry.name)
    expect(page).to_not have_content(@sherry.years_experience)
    expect(page).to_not have_content(@ash.name)
  end
end

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)
