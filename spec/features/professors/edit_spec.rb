require 'rails_helper'

RSpec.describe 'the professor update form page' do
  before :each do
    @mine = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @dumb = Professor.create!(name: 'Albus Dumbledore', age: 345, specialty: 'Hubris')
  end

  it 'updates and redirects on form submit' do
    visit "/professors/#{@mine.id}/edit"

    expect(page).to have_content('Update Info for Minerva McGonagall')

    fill_in 'name', with: 'Severus Snape'
    fill_in 'age', with: 63
    fill_in 'specialty', with: 'Occlumency'

    click_button 'Update Professor'

    expect(current_path).to eq('/professors')

    within("#professor-#{@mine.id}") do
      expect(page).to have_content('Severus Snape')
      expect(page).to have_content('Age: 63')
      expect(page).to have_content('Specialty: Occlumency')
    end
  end
end
