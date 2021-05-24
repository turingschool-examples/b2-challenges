# As a user,
# When I go to a mechanics show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page
#
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
#
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
#
# Add a ride to workload:
# Ride Id: _pretend_this_is_a_textfield_
# Submit

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

  it 'can add a ride to mechanic workload' do
    new_ride = Ride.create!(name: 'Scrambler', thrill_rating: 4, open: true)

    visit "/mechanics/#{@jim.id}"

    expect(page).to have_content 'Add a ride to workload:'
    fill_in 'Ride Id', with: "#{new_ride.id}"
    click_on 'Submit'

    expect(page).to have_content 'Scrambler'
  end
end
