require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  before :each do
    @kara = Artist.create!(name: 'Kara Smith', years_of_experience: 11)
    @alex = Artist.create!(name: 'Alex Potter', years_of_experience: 17)
    @brian = Artist.create!(name: 'Brian Simpson', years_of_experience: 3)
  end

  it 'shows all mechanics name and their years of experience' do
    visit '/artists'

    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_of_experience)
    expect(page).to have_content(@alex.name)
    expect(page).to have_content(@alex.years_of_experience)
    expect(page).to have_content(@brian.name)
    expect(page).to have_content(@brian.years_of_experience)
    expect(page).to have_content(@mechanics.average_years_of_experience)
  end
end
