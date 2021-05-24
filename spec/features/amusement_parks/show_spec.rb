require 'rails_helper'

RSpec.describe 'amusement park info page' do

  before :all do
    @park = AmusementPark.create!(name: "Elitch Gardens", price: 70.00)
    @ride1 = @park.rides.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
    @ride2 = @park.rides.create!(name: "Top Rock", open: true, thrill_rating: 3)
  end

  it 'has functionality from extension' do
    #Extension - Amusement Park Show page

    #As a visitor,
    #When I visit an amusement park’s show page
    #I see the name and price of admissions for that amusement park
    #And I see the names of all the rides that are at that theme park listed in alphabetical order
    #And I see the average thrill rating of this amusement park’s rides
    #Ex: Hershey Park
       #Admissions: $50.00

       #Rides:
              #1. Lightning Racer
              #2. Storm Runner
              #3. The Great Bear
       #Average Thrill Rating of Rides: 7.8/10
    visit "/amusement_parks/#{@park.id}"
    expect(page).to have_content @park.name
    expect(page).to have_content @park.price
    expect(@ride1.name).to appear_before(@ride2.name)
    expect(page).to have_content "#{@park.avg_thrill}/10"
  end

end
