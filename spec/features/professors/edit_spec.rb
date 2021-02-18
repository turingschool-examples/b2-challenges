require 'rails_helper'

RSpec.describe 'As a Visitor' do
  describe 'AWhen i visit professor index' do
    it 'I can update a professor' do
      professor1 = Professor.create!(name: 'Mr. Potter', age: 300, specialty: 'Transfiguration')

      visit '/professors'

      click_link 'Update'

      expect(current_path).to eq("/professors/#{professor1.id}/edit")

      fill_in 'Name', with: 'Beatles'
      fill_in 'Age', with: '5'
      fill_in 'specialty', with: 'Poison'


      click_on 'Submit'

      expect(current_path).to eq("/professors")
      expect(page).to have_content('Beatles')
      expect(page).to have_content('5')
      expect(page).to have_content('Poison')
    end
  end
end
