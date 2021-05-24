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
  end

  it 'displays the name of the park and admission price' do
    visit "/amusment_parks/#{@hershey.id}"

    expect(page).to have_content 'Hershey Park'
    expect(page).to have_content 'Admissions: $50.00'
  end

  it 'displays the names of all of the rides in alphabetical order'

  it 'displays the average thrill rating of this parks rides'
end
