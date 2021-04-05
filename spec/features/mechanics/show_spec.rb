require 'rails_helper'

RSpec.describe 'mechanics show' do

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Thomas Johnson", years_of_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Becky Johnson", years_of_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Carl Johnson", years_of_experience: 3)

    @ride_1 = @mechanic_1.rides.create!(name: "Top Thrill", thrill_rating: 55, open: true)
    @ride_2 = @mechanic_1.rides.create!(name: "Magnum", thrill_rating: 100, open: false)
    @ride_3 = @mechanic_2.rides.create!(name: "Falcon", thrill_rating: 70, open: true)
  end

  it 'lists current mechanic by id and their attributes' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_of_experience)
    expect(page).to have_content("Working On: [\"Top Thrill\"]")
  end

  it 'shows button_to add ride to their workload and redirects once clicked' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")

    expect(page).to have_content("Add a ride")
    fill_in('ride_id', with: "#{@ride_3.id}")

    expect(page).to have_button("Submit")
    click_button ("Submit")

    expect(page).to have_content("Working On: [\"Falcon\", \"Top Thrill\"]")
    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
  end
end
