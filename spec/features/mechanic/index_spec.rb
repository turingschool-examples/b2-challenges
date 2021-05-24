require 'rails_helper'

RSpec.describe Mechanic do
  describe 'index page' do
    it 'lists all mechanics & their attributes' do
      mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      mechanic_2 = Mechanic.create!(name: 'Jim Carrey', years_experience: 10)

      visit '/mechanics'

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_experience)
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.years_experience)
    end

    it 'shows the average years of experience' do
      mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      mechanic_2 = Mechanic.create!(name: 'Jim Carrey', years_experience: 10)

      visit '/mechanics'
      
      expect(page).to have_content(Mechanic.average_years_experience)
    end
  end
end
