require 'rails_helper'

RSpec.describe Mechanic do
  describe 'index page' do
    it 'lists all mechanics & their attributes' do
      mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
      mechanic_2 = Mechanic.create!(name: 'Jim Carrey', years_of_experience: 10)

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_of_experience)
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.years_of_experience)
    end
  end
end
