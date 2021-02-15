require 'rails_helper'

RSpec.describe 'Professors show page' do
  before :each do
    @mcgonagall = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
  end

  describe 'as a visitor' do
    it 'shows professor info' do
      visit "/professors/#{@mcgonagall.id}"

      within('#prof-info') do
        expect(page).to have_content('Minerva McGonagall')
        expect(page).to have_content('204')
        expect(page).to have_content('Transfiguration')
      end
    end
  end
end
