# Story 2 - Mechanic Show Page
#
# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)

require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @jim = Mechanic.create!(name: "Jim", years_experience: 17)

    @tea_cups = @jim.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true)
    @tot = @jim.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true)
    @swings = @jim.rides.create!(name: 'The Swings', thrill_rating: 5, open: true)
    @strawberry = @jim.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false)
  end

  it 'displays the mechanics name and years experience' do
    visit "/mechanics/#{@jim.id}"

    expect(page).to have_content 'Jim'
    expect(page).to have_content 'Experience: 17 years'
  end

  it 'shows names of all rides the mechanic is working on, ordered by thrill_rating' do
    visit "/mechanics/#{@jim.id}"

    expect(@tot.name).to appear_before(@swings.name)
    expect(@swings.name).to appear_before(@tea_cups.name)
  end

  it 'does not show rides that are not open' do
    visit "/mechanics/#{@jim.id}"

    expect(page).to_not have_content 'Strawberry Fields'
  end
end
