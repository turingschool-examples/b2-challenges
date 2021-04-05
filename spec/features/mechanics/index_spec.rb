require 'rails_helper'
# Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

RSpec.describe "Mechanics Index Page" do
  before {
    @kon = Mechanic.create!(name: "Kon", years_exp: 4 )
    @ryan = Mechanic.create!(name: "Ryan", years_exp: 1 )
    @joe = Mechanic.create!(name: "Joe", years_exp: 4 )
  }
  describe "As a visitor" do
    it "I see a header saying 'All Mechanics'" do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
    end

    it "And I see a list of mechanics names and years experience" do
      visit '/mechanics'

      expect(page).to have_content("Kon")
      expect(page).to have_content(4)
      expect(page).to have_content("Ryan")
      expect(page).to have_content(1)
      expect(page).to have_content("Joe")
      expect(page).to have_content(4)
    end

    it "And I see the average years experience across all mechanics" do
      visit '/mechanics'

      expect(page).to have_content("Average years experience across all mechanics:")
      expect(page).to have_content(3)
    end
  end
end
