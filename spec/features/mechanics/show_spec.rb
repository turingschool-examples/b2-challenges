require 'rails_helper'

RSpec.describe 'the mechanic show' do
  it 'lists the mechanics attributes' do
    mechanic_1 = Mechanic.create!(name: 'Fix it Felix Jr.', years_experience: 20)
    mechanic_2 = Mechanic.create!(name: 'Bob the Builder', years_experience: 10)
    ride_2 = mechanic_1.rides.create!(name: 'Kiddy Carts', thrill_rating: 2, open: true)
    ride_1 = mechanic_1.rides.create!(name: 'Crazy Coaster', thrill_rating: 10, open: true)
    ride_3 = mechanic_1.rides.create!(name: 'Tower of Doom', thrill_rating: 20, open: false)

    visit "/mechanics/#{mechanic_1.id}"
    
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content('Crazy Coaster')
    expect(page).to have_content('Kiddy Carts')
    expect(page).to_not have_content('Tower of Doom')
    expect('Crazy Coaster').to appear_before('Kiddy Carts')
  end
end


