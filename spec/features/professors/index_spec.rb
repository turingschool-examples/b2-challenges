require 'rails_helper'

RSpec.describe 'the professor index page' do
  before :each do
    @mine = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @dumb = Professor.create!(name: 'Albus Dumbledore', age: 345, specialty: 'Hubris')
  end

  it 'displays prof attributes' do
    visit '/professors'
    within("#professor-#{@mine.id}") do
      expect(page).to have_link('Minerva McGonagall')
      expect(page).to have_content('Age: 204')
      expect(page).to have_content('Specialty: Transfiguration')
    end
  end
  it 'has a link to an update form for each' do
    visit '/professors'
    within("#professor-#{@mine.id}") do
      expect(page).to have_link('Update Professor Info')
    end
    within("#professor-#{@dumb.id}") do
      expect(page).to have_link('Update Professor Info')

      click_link 'Update Professor Info'

      expect(current_path).to eq("/professors/#{@dumb.id}/edit")
    end
  end
end
