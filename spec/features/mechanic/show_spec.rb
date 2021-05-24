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
  end
end