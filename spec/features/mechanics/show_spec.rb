require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do


#   Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)
it "Mechanic show page shows attributes" do
  mechanic_one = Mechanic.create!(name: 'Samantha West', years_of_experience: 5 )
  ride_one = Ride.create!(name: "Roller Coaster", thrill_rating: 9, is_open: false)
  ride_two = Ride.create!(name: "Ferris Wheel", thrill_rating: 1, is_open: false)
  # save_and_open_page
  visit "/mechanics/#{mechanic_one.id}"
  expect(page).to have_content("Samantha West")
  expect(page).to have_content("Years of Experience")
end


end
