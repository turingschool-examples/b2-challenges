require 'rails_helper'

RSpec.describe 'mechanics index page' do

  before :all do
    @mech = Mechanic.create!(name: "Marty", years_experience: 3)
    @mech2 = Mechanic.create!(name: "Gregor", years_experience: 15)
    @mech3 = Mechanic.create!(name: "Sarah", years_experience: 7)
    @ride1 = Ride.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
  end

  describe 'index etc' do
    it 'lists mechanics and their details' do
      #Story 1 - Mechanic Index Page
      #As a user,
      #When I visit the mechanics index page
      #I see a header saying “All Mechanics”
      #And I see a list of all mechanic’s names and their years of experience
      #And I see the average years of experience across all mechanics
      visit '/mechanics'
      within 'h2' do
        expect(page).to have_content "All Mechanics"
      end
      within 'ul' do
        expect(page).to have_content @mech.name
        expect(page).to have_content @mech2.years_experience
      end
      expect(page).to have_content("Our mechanics have an average of #{Mechanic.all.avg_exp} years of experience.")
    end
  end

end
