require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @professor1 = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
  end

  describe 'When I click the link "Update"' do
    it 'I am taken to that professors edit page' do
      visit '/professors'
      click_link('Update')

      expect(current_path).to eq("/professors/#{@professor1.id}/edit")
    end
    
    it 'I am taken to a form where I can input a new name, age, and specialty' do
      visit '/professors'
      click_link('Update')

      within("#professor-#{@professor1.id}-edit") do
        expect(page).to have_content("Name:")
        expect(page).to have_content("Age:")
        expect(page).to have_content("Specialty:")
        expect(page).to have_button('Submit')
      end
    end

    it 'I am taken back to the professors index where I see that professor has been updated' do
      visit '/professors'
      click_link('Update')

      within("#professor-#{@professor1.id}-edit") do
        fill_in :name, with: 'New named professor'

        click_button('Submit')
      end
      expect(current_path).to eq('/professors')
      expect(page).to have_content('New named professor')
    end
  end
end
