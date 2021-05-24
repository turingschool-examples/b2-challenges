require 'rails_helper'

RSpec.describe 'Mechanic index page', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Bob Jones", years_experience: 12)
    @mechanic2 = Mechanic.create!(name: "Sally Fields", years_experience: 23)
    @mechanic3 = Mechanic.create!(name: "Sal Junior", years_experience: 4)

    visit '/mechanics'
  end

  it 'shows a list of mechanics names and experience under "All Mechanics"' do
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_experience)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic2.years_experience)
    expect(page).to have_content(@mechanic3.name)
    expect(page).to have_content(@mechanic3.years_experience)
  end

  it 'shows average years of experience across all mechanics' do
    expect(page).to have_content("Average years experience: 13")
  end

end
