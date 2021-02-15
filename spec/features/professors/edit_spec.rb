require 'rails_helper'

RSpec.describe 'Professors edit page' do
  before :each do
    @snape = Professor.create!(name: 'Severus Snape', age: 36, specialty: 'Potions')
  end

  describe 'as a visitor' do
    it 'loads with saved data' do
      visit "professors/#{@snape.id}/edit"

      within('#edit-form') do
        expect(find_field('name').value).to eq(@snape.name)
        expect(find_field('age').value.to_i).to eq(@snape.age)
        expect(find_field('specialty').value).to eq(@snape.specialty)
      end
    end

    it 'can save changes' do
      visit "professors/#{@snape.id}/edit"

      within('#edit-form') do
        fill_in 'name', with: 'Bob Gu'
        fill_in 'age', with: '31'
        fill_in 'specialty', with: 'Programming'
        click_button('Save Changes')
      end

      expect(current_path).to eq('/professors')
      expect(page).to_not have_content('Severus Snape')
      expect(page).to have_content('Bob Gu')
    end
  end
end
