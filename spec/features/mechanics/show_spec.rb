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
    expect(page).to_not have_content(mechanic_2.name)
    expect(page).to have_content('Crazy Coaster')
    expect(page).to have_content('Kiddy Carts')
    expect(page).to_not have_content('Tower of Doom')
    expect('Crazy Coaster').to appear_before('Kiddy Carts')
  end
  #need to change from one to many to many to many
  xit 'adds a ride to the mechanic' do
    mechanic_1 = Mechanic.create!(name: 'Fix it Felix Jr.', years_experience: 20)
    ride_1 = Ride.create!(name: 'Crazy Coaster', thrill_rating: 10, open: true)

    visit "/mechanics/#{mechanic_1.id}"
    fill_in 'Ride ID:', with: "#{ride_1.id}"
    click_button 'Add'
    #refactor to section if you have time
    expect(page).to have_content('Crazy Coaster')
    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
  end
end


