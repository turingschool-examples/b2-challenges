require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  describe '#index' do
    it 'can list all the mechanics with their names and years of experience' do
      bobby= Mechanic.create!(name: "Bobby", years_experience: 5)
      greg = Mechanic.create!(name: "Greg", years_experience: 10)
      james = Mechanic.create!(name: "James", years_experience: 3)
      derris = Mechanic.create!(name: "Derris", years_experience: 1)

      visit '/mechanics'

      expect(page).to have_content(bobby.name)
      expect(page).to have_content(greg.name)
      expect(page).to have_content(james.name)
      expect(page).to have_content(derris.name)
      expect(page).to have_content(bobby.years_experience)
      expect(page).to have_content(greg.years_experience)
      expect(page).to have_content(james.years_experience)
      expect(page).to have_content(derris.years_experience)
    end

    it 'can display the average years of experience for all mechancis' do
      bobby= Mechanic.create!(name: "Bobby", years_experience: 5)
      greg = Mechanic.create!(name: "Greg", years_experience: 10)
      james = Mechanic.create!(name: "James", years_experience: 3)
      derris = Mechanic.create!(name: "Derris", years_experience: 1)

      visit '/mechanics'

      expect(page).to have_content(Mechanic.average_years_exp)
    end
  end
end