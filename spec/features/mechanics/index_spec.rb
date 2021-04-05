require 'rails_helper'

describe 'the mechanics index page' do
  it 'lists all of the mechanics name and their years of experience' do
    mech_1 = Mechanic.create!(name: 'bob', years_experience: 12)
    mech_2 = Mechanic.create!(name: 'dod', years_experience: 21)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mech_1.name)
    expect(page).to have_content(mech_1.years_experience)

    expect(page).to have_content(mech_2.name)
    expect(page).to have_content(mech_2.years_experience)
  end
end