# Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

require 'rails_helper'

RSpec.describe 'mechanic index' do
  before :each do
    @jim = Mechanic.create!(name: "Jim", years_experience: 17)
    @xena = Mechanic.create!(name: "Xena", years_experience: 23)
  end

  it 'lists all mechanics names' do
    visit '/mechanics'

    expect(page).to have_content 'All Mechanics'
    expect(page).to have_content 'Jim'
    expect(page).to have_content 'Xena'
  end

  it "lists each mechanic\'s years of experience" do
    visit '/mechanics'

    within "div#mechanic-#{@jim.id}" do
      expect(page).to have_content 'Experience: 17 years'
    end
  end

  it "displays the average years expereince across all mechanics" do
    visit '/mechanics'

    expect(page).to have_content 'Average years of experience: 20'
  end
end
