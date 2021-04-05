require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @josie = Mechanic.create!(name: 'Josie', years_of_experience: 3)
    @emmy = Mechanic.create!(name: 'Emmy', years_of_experience: 5)
    @bella = Mechanic.create!(name: 'Bella', years_of_experience: 1)
  end
  describe 'I visit a mechanic show page' do
    it 'Then I see their name name, years of experience, and rides that they are working on' do
      visit "/mechanics/#{@emmy.id}"
      expect(page).to have_content(@emmy.name)
      expect(page).to have_content(@emmy.years_of_experience)
      expect(page).to have_content(@emmy.rides)
    end
  end
end
