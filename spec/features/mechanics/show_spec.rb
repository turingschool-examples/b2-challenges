require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  before(:each) do
    @mechanic = Mechanic.create!(name: 'Bob', years_experience: 3)
    @ride_1 = @mechanic.rides.create!(name: 'Twister', thrill_rating: 6, open: true)
    @ride_2 = @mechanic.rides.create!(name: 'Ferris Wheel', thrill_rating: 2, open: true)
    @ride_3 = @mechanic.rides.create!(name: 'Tower of Doom', thrill_rating: 10, open: true)
    @ride_4 = @mechanic.rides.create!(name: 'Zipper', thrill_rating: 9, open: false)
  end
    # Story 2 - Mechanic Show Page
    # As a user,
    # When I visit a mechanic show page
    # I see their name, years of experience, and the names of all rides they’re working on
    # And I only see rides that are open
    # And the rides are listed by thrill rating in descending order (most thrills first)
  it 'shows the mechanics attributes' do
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_experience)
  end

  it 'shows the names of the rides they are working on' do
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
  end

  it 'shows only open rides' do
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to_not have_content(@ride_4.name)
  end

  it 'shows rides ordered by thrills' do
    visit "/mechanics/#{@mechanic.id}"
    expect(page.all(".ride")[0].text).to eq(@ride_3.name)
    expect(page.all(".ride")[1].text).to eq(@ride_1.name)
    expect(page.all(".ride")[2].text).to eq(@ride_2.name)
  end

  it 'can add a ride to a mechanic' do
    # Story 3 - Add a Ride to a Mechanic
    # As a user,
    # When I go to a mechanics show page
    # I see a form to add a ride to their workload
    # When I fill in that field with an id of an existing ride and hit submit
    # I’m taken back to that mechanic's show page
    # And I see the name of that newly added ride on this mechanics show page
    ride = Ride.create!(name: 'Tea Cups', thrill_rating: 3, open: true)
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to_not have_content(ride.name)
    fill_in :ride_id, with: ride.id
    click_button('Add ride to mechanic')
    expect(current_path).to eq("/mechanics/#{@mechanic.id}")
    expect(page).to have_content(ride.name)
  end
end
