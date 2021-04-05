require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Alan Brown", years_of_experience: 14)
    @mechanic2 = Mechanic.create!(name: "Ziggy Lowe", years_of_experience: 5)
    @mechanic3 = Mechanic.create!(name: "Charlie Tei", years_of_experience: 18)

    visit '/mechanics'
  end

  it 'can see a list of all mechanics with attributes' do
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic3.name)
    expect(page).to have_content(@mechanic1.years_of_experience)
    expect(page).to have_content(@mechanic2.years_of_experience)
    expect(page).to have_content(@mechanic3.years_of_experience)
    expect(page).not_to have_content("Mechanic That Doesn't Exist")
    expect(page).not_to have_content(10)
    expect(page).to have_content("Average years of experience across all mechanics: 12.33")
  end
end
