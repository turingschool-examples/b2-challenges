# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
#
# Note: You may have to make new migrations for this story
require 'rails_helper'

RSpec.describe 'amusement park show' do
  before :each do
    @hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)
    @tea_cups = @hershey.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true)
    @tot = @hershey.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true)
    @swings = @hershey.rides.create!(name: 'The Swings', thrill_rating: 5, open: true)
    @strawberry = @hershey.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false)
  end

  it 'displays the name of the park and admission price' do
    visit "/amusement_parks/#{@hershey.id}"

    expect(page).to have_content 'Hershey Park'
    expect(page).to have_content 'Admissions: $50.00'
  end

  it 'displays the names of all of the rides in alphabetical order' do
    visit "/amusement_parks/#{@hershey.id}"

    expect(@strawberry.name).to appear_before(@swings.name)
    expect(@swings.name).to appear_before(@tea_cups.name)
    expect(@tea_cups.name).to appear_before(@tot.name)
  end

  it 'displays the average thrill rating of this parks rides'
end
