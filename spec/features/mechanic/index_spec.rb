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

    it 'I can see an average of all the years of experience for mechanics' do
      mech1 = Mechanic.create!(
        name: "Bob",
        years_experience: 12
      )
      mech1 = Mechanic.create!(
        name: "Bobette",
        years_experience: 15
      )

      visit 'mechanics'

      expect(page).to have_content("Average years of experience for all mechanics: 13.5")
    end
  end
end
