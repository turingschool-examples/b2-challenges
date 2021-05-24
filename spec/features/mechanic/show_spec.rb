require 'rails_helper'



# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

describe 'Mechanic show page' do
  it "has the mech's name and experience and the names of the rides they are working on, only open rides, listed by thrill rating" do
    jim = Mechanic.create(name:'Jim Bob', years_experience: 2)
    ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false)
    ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true)
    ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true)
    thing = RideMechanic.create(mechanic: jim, ride: ride1)
    otherthing = RideMechanic.create(mechanic: jim, ride: ride2)
    otherotherthing = RideMechanic.create(mechanic: jim, ride: ride3)

    visit "/mechanics/#{jim.id}"
    expect(page).to have_content('Jim Bob')
    expect(page).to have_content(2)
    expect(page).to have_content('slow, boring ride')
    expect(page).to have_content('flying death trap')
    expect(page).to have_content(1)
    expect(page).to have_content(10)
    expect(page).to_not have_content(7)
    expect(page.text.index(ride3.name)).to be < page.text.index(ride2.name)
  end

#   As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page

  it 'has a link to a form to add a ride to mechanic. give ID of existing ride, back to mech show page, shows updated with new ride' do
    jim = Mechanic.create(name:'Jim Bob', years_experience: 2)
    ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false)
    ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true)
    ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true)
    thing = RideMechanic.create(mechanic: jim, ride: ride1)
    otherthing = RideMechanic.create(mechanic: jim, ride: ride2)
    visit "/mechanics/#{jim.id}"
    expect(page).to_not have_content(10)
    expect(page).to_not have_content('flying death trap')
    click_on "add ride"
    expect(current_path).to eq "/mechanics/#{jim.id}/ride_mechanics/new"
    fill_in 'rideid', with: "#{ride3.id}"
    click_on "Submit"
    expect(current_path).to eq "/mechanics/#{jim.id}"
    expect(page).to have_content(10)
    expect(page).to have_content('flying death trap')
  end
end