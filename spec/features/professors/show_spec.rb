require 'rails_helper'

RSpec.describe 'Professors show page' do
  before :each do
    @mcgonagall = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @mcgonagall.students.create!(name: 'Bobby Hill', age: 15)
    @mcgonagall.students.create!(name: 'Wesley Crusher', age: 22)
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

    it 'shows professor student names' do
      visit "/professors/#{@mcgonagall.id}"

      within('#prof-students') do
        expect(page).to have_content('Bobby Hill')
        expect(page).to have_content('Wesley Crusher')
      end
    end
  end
end
