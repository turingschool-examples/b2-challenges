require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Josie', years_of_experience: 3)
    @ride1 = @mechanic1.rides.create!(name: 'Spooky Coaster', open: true, thrill_score: 10)
    @ride2 = @mechanic1.rides.create!(name: 'Thrill Factory', open: false, thrill_score: 3)
    @ride3 = @mechanic1.rides.create!(name: 'Jurrasic Journey', open: true, thrill_score: 15)
  end

  it 'shows mechanic attributes' do
      visit "/mechanics/#{@mechanic1.id}"
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic1.years_of_experience)
  end

  it 'I can see rides they are working on if they are open' do
      visit "/mechanics/#{@mechanic1.id}"
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride3.name)
  end

  it 'order rides by thrills' do
    visit "/mechanics/#{@mechanic1.id}"
    expect(page.all(".ride")[0].text).to eq(@ride3.name)
    expect(page.all(".ride")[1].text).to eq(@ride1.name)
    expect(page.all(".ride")[2].text).to eq(@ride2.name)
  end

  it 'can add a ride to a mechanic' do
    ride = Ride.create!(name: 'new ride', thrill_score: 1, open: true)

    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to_not have_content(ride.name)

    fill_in :ride_id, with: ride.id
    click_button('Add this ride to this mechanic')

    expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
    expect(page).to have_content(ride.name)
  end
end
