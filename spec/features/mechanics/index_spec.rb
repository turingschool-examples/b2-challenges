require 'rails_helper'

RSpec.describe 'Mechanics Index'do
  before(:each) do
    @jane = Mechanic.create(name: "Jane G", years_experience: 12)
    @sherry = Mechanic.create(name: "Sherry S", years_experience: 28)
    @ash = Mechanic.create(name: "Ashley M", years_experience: 4)
  end

  it'lists a mechanic with their name and attributes and I can see the average years of exeprience' do
    visit '/mechanics'

    exepct(page).to have_content("All Mechanics")
    expect(page).to have_content(@jane.name)
    expect(page).to have_content(@jane.years_experience)
    expect(page).to have_content(@sherry.name)
    expect(page).to have_content(@sherry.years_experience)
    expect(page).to have_content(@ash.name)
    expect(page).to have_content(@ash.years_experience)
    expect(page).to have_content("Average age of Mechanics: 14.7")
  end
end



# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
