require 'rails_helper'
# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

RSpec.describe "Mechanics Index Page" do
  describe "As a visitor" do
    it "I see a header saying 'All Mechanics'" do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
    end
  end
end
