require 'rails_helper'

RSpec.describe "mechanic show", type: :feature do
  before :each do
    @steve= Mechanic.create!(name: "steve", years_experience: 10)
    @bob= Mechanic.create!(name: "bob", years_experience: 8)
    @joey= Mechanic.create!(name: "joey", years_experience: 9)
    @whirly= Ride.create!(name: "whirly", thrill_rating: 2, open: true)
    @woot= Ride.create!(name: "woot", thrill_rating: 3, open: false)
    MechanicRide.create!(mechanic_id: @steve.id, ride_id: @whirly.id)
    MechanicRide.create!(mechanic_id: @steve.id, ride_id: @woot.id)

  end
  it "can see the mechanics details" do
    
    visit "/mechanics/#{@steve.id}"
    expect(page).to have_content(@steve.name)
    expect(page).to have_content(@steve.years_experience)
    within("#ride-#{@whirly.id}") do 
      expect(page).to have_content(@whirly.name)
    end
  end
end