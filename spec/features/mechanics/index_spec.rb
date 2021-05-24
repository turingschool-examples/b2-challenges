require 'rails_helper'

RSpec.describe 'mechanics index page' do

  before :all do
    @mech = Mechanic.create!(name: "Marty", years_of_experience: 3)
    @ride1 = Ride.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
  end

  describe 'index etc' do
    #Story 1 - Mechanic Index Page
    #As a user,
    #When I visit the mechanics index page
    #I see a header saying “All Mechanics”
    #And I see a list of all mechanic’s names and their years of experience
    #And I see the average years of experience across all mechanics

  end

end
