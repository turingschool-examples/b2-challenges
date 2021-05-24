require 'rails_helper'

RSpec.describe 'mechanic show page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Lois Iddrisu', years_of_experience: 6)
    @mechanic_3 = Mechanic.create!(name: 'Bob Stewart', years_of_experience: 7)

    @ride_1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true)
    @ride_2 = Ride.create!(name: 'Bumper Cars', thrill_rating: 7, open: true)
    @ride_3 = Ride.create!(name: 'Goliath', thrill_rating: 10, open: true)
    @ride_4 = Ride.create!(name: 'Super Scream Drop', thrill_rating: 8, open: false)
    @ride_5 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 6, open: true)

    @mechanic_1.rides << @ride_1
    @mechanic_2.rides << @ride_2
    @mechanic_3.rides << @ride_3
    @mechanic_1.rides << @ride_4
    @mechanic_1.rides << @ride_5
  end

  it 'has a show page' do
    visit "/mechanics/#{@mechanic_1.id}"
    visit "/mechanics/#{@mechanic_2.id}"
    visit "/mechanics/#{@mechanic_3.id}"
  end

  it 'has the name, years of experience, and names of rides associated displayed on show page for each mechanic' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("#{@mechanic_1.name}")
    expect(page).to have_content("#{@mechanic_1.years_of_experience}")
    expect(page).to have_content("#{@ride_1.name}")
    expect(page).to have_content("#{@ride_5.name}")
  end

  it 'does not display the names of closed rides' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_no_content("#{@ride_4.name}")
  end

  it 'displays the names of the rides associated by most to least thrills' do
    visit "/mechanics/#{@mechanic_1.id}"

      expect(page.all('h3')[0]).to have_content("#{@ride_5.name}")
      expect(page.all('h3')[1]).to have_content("#{@ride_1.name}")
  end
end
