require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Jamie', years_experience: 17)
    @mechanic_2 = Mechanic.create!(name: 'Thomas', years_experience: 10)
    @mechanic_3 = Mechanic.create!(name: 'Kelly', years_experience: 26)
  end

  it 'has a header' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
  end

  it 'has list of mechanics and their years of experience' do
    visit '/mechanics'

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_experience)
  end

  it 'has mechanics average years of experience' do
    visit '/mechanics'

    expect(page).to have_content("Average years of experience: 17.7")
  end
end
