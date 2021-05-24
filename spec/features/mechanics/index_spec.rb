require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  describe '#index' do
    it 'shows all mechanics and their attruibutes' do
      mechanic_1 = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
      mechanic_2 = Mechanic.create!(name: 'Darrel Smith', years_experience: 5)

      visit '/mechanics'

      expect(page).to have_content('Jim Bob')
      expect(page).to have_content(10)
      expect(page).to have_content('Darrel Smith')
      expect(page).to have_content(5)
    end

    it 'shows the average experience of all mechanics' do
      mechanic_1 = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
      mechanic_2 = Mechanic.create!(name: 'Darrel Smith', years_experience: 5)

      visit '/mechanics'

      expect(page).to have_content(7.5)
    end
  end
end