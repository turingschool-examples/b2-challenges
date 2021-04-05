require 'rails_helper'

RSpec.describe 'User Story 2', type: :feature do
  it 'can display the mechanic show page' do
    steve = Mechanic.create!(name: "Steve Brown", years_of_experience: 27)
    loop_de_loop = Ride.create!(name: "Loop de Loop", is_open: true, thrill_rating: 8)
    x_treme = Ride.create!(name: "XTreme Scream", is_open: false, thrill_rating: 10)
    sling = Ride.create!(name: "Sling Shot", is_open: true, thrill_rating: 5)
    record_1 = RideMechanic.create!(mechanic_id: steve.id, ride_id: ride.id)

    visit "/mechanics/#{steve.id}"
    # require 'pry'; binding.pry
    expect(page).to have_content("Steve Brown")
    expect(page).to have_content("27")
    expect(page).to have_content("Loop de Loop")
    expect(page).to have_content("8")
    expect(page).to have_content("Sling")
    expect(page).to have_content("5")
    
  end
end

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)