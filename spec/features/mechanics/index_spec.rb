require 'rails_helper'

RSpec.describe 'mechanic index' do
  it 'displays all mechanics' do
    mechanic1 = Mechanic.create(name: 'Kara', years_experience: 11)
    mechanic2 = Mechanic.create!(name: 'James', years_experience: 5)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("#{mechanic1.name}")
    expect(page).to have_content("#{mechanic1.years_experience}")
    expect(page).to have_content("#{mechanic2.name}")
    expect(page).to have_content("#{mechanic2.years_experience}")
  end
end
