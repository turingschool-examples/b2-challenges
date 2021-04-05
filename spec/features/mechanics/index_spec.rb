require 'rails_helper'

RSpec.describe 'When I visit the mechanics index page' do
  it 'S1: I see a header that displays ALL MECHANICS' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    mechanic_2 = Mechanic.create(name: 'Johnny Bee', years_experience: 6)
    mechanic_4 = Mechanic.create(name: 'Molly Lee', years_experience: 5)

    visit "/mechanics"
    expect(page).to have_content("All Mechanics")
  end

  it 'S1: I see all mechanics names and years experience' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    mechanic_2 = Mechanic.create(name: 'Johnny Bee', years_experience: 6)
    mechanic_4 = Mechanic.create(name: 'Molly Lee', years_experience: 5)

    visit "/mechanics"
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.years_experience)
    expect(page).to have_content(mechanic_3.name)
    expect(page).to have_content(mechanic_3.years_experience)
  end

  it 'S1: I see average years experience of all mechanics' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    mechanic_2 = Mechanic.create(name: 'Johnny Bee', years_experience: 6)
    mechanic_4 = Mechanic.create(name: 'Molly Lee', years_experience: 5)

    visit "/mechanics"
    expect(page).to have_content("Average Years Experience: ")
  end
end
