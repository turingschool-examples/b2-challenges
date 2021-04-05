require 'rails_helper'

RSpec.describe "Mechanics index page", type: :feature do
  describe 'As a user, when I visit the index page' do
    it "I can see a list of all mechanics's names and years of experience" do
      mech1 = Mechanic.create!(
        name: "Bob",
        years_experience: 12
      )
      mech1 = Mechanic.create!(
        name: "Bobette",
        years_experience: 15
      )

      visit '/mechanics'

      expect(page).to have_content("Bob")
      expect(page).to have_content("Bobette")
      expect(page).to have_content("12")
      expect(page).to have_content("15")
    end
  end
end
