require 'rails_helper'

RSpec.describe 'mechanic index page' do
  before :each do
    @kassy = Mechanic.create!(name: "Kassy Cooper", years_experience: 10)
    @james = Mechanic.create!(name: "James White", years_experience: 21)
    @brittany = Mechanic.create!(name: "Brittany Counts", years_experience: 15)
    @katie = Mechanic.create!(name: "Katie Parr", years_experience: 22)
  end

  context 'initial page' do
    it 'has a header' do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
    end

    it 'can list all mechanics and their attributes' do
      visit '/mechanics'

      expect(page).to have_content(@kassy.name)
      expect(page).to have_content(@kassy.years_experience)
      expect(page).to have_content(@james.name)
      expect(page).to have_content(@brittany.name)
      expect(page).to have_content(@brittany.years_experience)
      expect(page).to have_content(@katie.name)
      expect(page).to have_content(@katie.years_experience)
    end
  end
end
