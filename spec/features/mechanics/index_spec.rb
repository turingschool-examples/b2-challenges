
require "rails_helper"

RSpec.describe 'the mechanic index' do
  it 'lists all the mechanics with their attributes' do
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)

    visit "/mechanics"

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
  end
  it 'has the average years of experience of all mechanics' do
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)
    mechanic_2 = Mechanic.create!(name: 'Sally', years_experience: 3)
    mechanic_3 = Mechanic.create!(name: 'Marph', years_experience: 5)

    visit '/mechanics'

    expect(page).to have_content('6')
  end
end
