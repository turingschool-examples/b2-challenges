require 'rails_helper'

RSpec.describe 'the mechanics index page' do
  it 'lists all mechanic’s names and their years of experience' do
    mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 3)
    mechanic2 = Mechanic.find_or_create_by!(name: "Goliath", years_experience: 24)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic1.name)
    expect(page).to have_content(mechanic2.name)
    expect(page).to have_content(mechanic1.years_experience)
    expect(page).to have_content(mechanic2.years_experience)
  end

  it 'shows the average years of experience across all mechanics' do
    mechanic1 = Mechanic.find_or_create_by!(name: "Klaud", years_experience: 30)
    mechanic2 = Mechanic.find_or_create_by!(name: "Goliath", years_experience: 24)

    visit '/mechanics'

    expect(page).to have_content("Average years of experience: 27")
  end 
end
