require 'rails_helper'

RSpec.describe 'Professors show page' do
  before :each do
    @mcgonagall = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @snape = Professor.create!(name: 'Severus Snape', age: 36, specialty: 'Potions')
    @bobby = @mcgonagall.students.create!(name: 'Bobby Hill', age: 15)
    @wesley = @mcgonagall.students.create!(name: 'Wesley Crusher', age: 21)
  end

  describe 'as a visitor' do
    it 'shows all professors' do
      visit 'professors'

      within('#professors') do
        expect(page).to have_content('Minerva McGonagall')
        expect(page).to have_content('Severus Snape')
      end
    end

    it 'shows edit link for each professor' do
      visit 'professors'

      within('#professors') do
        edit_links = page.all('.prof-edit-link')
        expect(edit_links.length).to eq(2)
      end
    end

    it 'edit link sends to correct professor edit page' do
      visit 'professors'

      click_link("edit-prof-#{@snape.id}")
      expect(current_path).to eq("/professors/#{@snape.id}/edit")
    end
  end
end
