require 'rails_helper'

RSpec.describe 'the mechanic index' do
  it 'has a header saying All Mechanics' do

    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
  end
  it 'lists all of the mechanics and their attributes' do
    mechanic_1 = Mechanic.create!(name: 'Fix it Felix Jr.', years_experience: 20)
    mechanic_2 = Mechanic.create!(name: 'Bob the Builder', years_experience: 10)

    visit '/mechanics'
    
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.years_experience)
    expect(page).to have_content(mechanic_2.years_experience)
    expect(page).to have_content(15)
  end
end