require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  describe '#show' do
    it 'shows mechanic with same id' do
      mechanic = Mechanic.create!(name: 'Jim Bob', years_experience: 10)

      visit "mechanics/#{mechanic.id}"

      expect(page).to have_content('Jim Bob')
      expect(page).to have_content(10)
    end
  end
end