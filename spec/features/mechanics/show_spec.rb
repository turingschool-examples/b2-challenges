require 'rails_helper'

RSpec.describe 'mechanic show' do
  it 'displays mechanic' do
    mechanic1 = Mechanic.create!(name: 'Kara', years_experience: 11)
    mechanic2 = Mechanic.create!(name: 'James', years_experience: 5)
    ride1 = Ride.create!(name: 'Scrambler', thrill_rating: 5, open: true)
    ride2 = Ride.create!(name: 'Nitro', thrill_rating: 10, open: true)
    ride3 = Ride.create!(name: 'Zipper', thrill_rating: 3, open: true)
    set1 = MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride1.id)
    set2 = MechanicRide.create!(mechanic_id: mechanic1.id, ride_id: ride3.id)
    set3 = MechanicRide.create!(mechanic_id: mechanic2.id, ride_id: ride2.id)
    set4 = MechanicRide.create!(mechanic_id: mechanic2.id, ride_id: ride1.id)

    visit "/mechanics/#{mechanic1.id}"

    expect(page).to have_content("#{mechanic1.name}")
    expect(page).to have_content("#{mechanic1.years_experience}")
    expect(page).to have_content("#{ride3.name}")
    # expect(page).to have_content("#{mechanic2.}")
    # expect(page).to have_content("#{mechanic2.years_experience}")
  end
end
