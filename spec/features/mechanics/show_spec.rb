require 'rails_helper'

RSpec.describe 'mechanic show' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Sam", years_experience: 3)
    @mechanic_2 = Mechanic.create!(name: "James", years_experience: 9)

  end

  it 'shows a mechanics attributes' do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content("Current rides they’re working on")
  end

  it 'shows a mechanics attributes' do
    visit "/mechanics/#{@mechanic_2.id}"
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_experience)
    expect(page).to have_content("Current rides they’re working on")
  end
end