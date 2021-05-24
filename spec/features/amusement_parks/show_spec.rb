require 'rails_helper'

RSpec.describe 'amusement park show page' do
  before(:each) do
    @ride_1 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 3, open: true)
    @ride_2 = Ride.create!(name: 'Bumper Cars', thrill_rating: 7, open: true)
    @ride_3 = Ride.create!(name: 'Goliath', thrill_rating: 10, open: true)
    @ride_4 = Ride.create!(name: 'Super Scream Drop', thrill_rating: 8, open: false)
    @ride_5 = Ride.create!(name: 'Tilt-a-Whirl', thrill_rating: 6, open: true)

    @park = AmusementPark.create!(name: 'Hershey Park', admissions: '$50.00')

    @park.rides << @ride_1
    @park.rides << @ride_2
    @park.rides << @ride_3
    @park.rides << @ride_4
    @park.rides << @ride_5
  end

  it 'can show the name and admission price of the park' do
    visit "/amusement_parks/#{@park.id}"

    expect(page).to have_content("#{@park.name}")
    expect(page).to have_content("#{@park.admissions}")
  end

  it 'can show the rides associated with the park alphabetically' do
    visit "/amusement_parks/#{@park.id}"

    expect(page.all('ord')[0]).to eq("#{@ride_2.name}")    expect(page.all('ord')[1]).to eq("#{@ride_1.name}")
    expect(page.all('ord')[2]).to eq("#{@ride_3.name}")
    expect(page.all('ord')[3]).to eq("#{@ride_4.name}")
    expect(page.all('ord')[4]).to eq("#{@ride_5.name}")
  end

  it 'can show the average thrill rating of the rides' do
    visit "/amusement_parks/#{@park.id}"

    expect(page).to have_content("Average Thrill Rating of Rides:")
    expect(page).to have_content("6.8/10")
  end

end
