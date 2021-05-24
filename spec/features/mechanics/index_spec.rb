require 'rails_helper'

RSpec.describe 'the mechanics index' do
  before (:each) do
    @mechanic_1 = Mechanic.create!(name: "Suzie Q", years_experience: 2)
    @mechanic_2 = Mechanic.create!(name: "Jane Doe", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Barak Obama", years_experience: 6)
  end

  describe 'page appearance' do
    it 'lists all the mechanics with their attributes' do
      visit "/mechanics"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@mechanic_2.years_experience)
      expect(page).to have_content(@mechanic_3.years_experience)
    end
    it 'states the average years of experience of all the mechanics' do
      visit "/mechanics"

      expect(page).to have_content("The average years of experience of mechanics is 4.0 years")
    end
  end
end
