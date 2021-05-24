require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  before :each do
    @ride_1 = Ride.create!(name: 'The Hurler', rating: 7, open: true)
    @ride_2 = Ride.create!(name: 'Magical Carousel', rating: 1, open: false)
    @ride_3 = Ride.create!(name: 'Wild Swings', rating: 8, open: true)
    @ride_4 = Ride.create!(name: 'Teacups', rating: 2, open: false)
    @ride_5 = Ride.create!(name: 'Wild Chipmunk', rating: 9, open: true)


    @mechanic_1 = Mechanic.create!(name: 'Pat Jones', experience: 3)
    @mechanic_2 = Mechanic.create!(name: 'Jaime Smith', experience: 5)

    RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_2)
    RideMechanic.create!(ride: @ride_4, mechanic: @mechanic_2)
    RideMechanic.create!(ride: @ride_5, mechanic: @mechanic_2)
  end

  it 'lists the mechanic name, years experience' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)

    expect(page).to_not have_content(@mechanic_2.name)
  end

  it 'lists the mechanics rides, that are open, by highest thrill rating first' do
    visit "/mechanics/#{@mechanic_1.id}"

    within("#ride-#{@ride_3.id}") do
      expect(page).to have_content(@ride_3.name)
    end

    within("#ride-#{@ride_1.id}") do
      expect(page).to have_content(@ride_1.name)
    end

    expect(page.all(".ride")[0].text).to eq(@ride_3.name)
    expect(page.all(".ride")[1].text).to eq(@ride_1.name)
  end

  it 'does not lists the mechanics rides, that are closed' do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to_not have_content(@ride_2.name)
  end

  it 'does not lists another mechanics open rides' do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to_not have_content(@ride_5.name)
  end

  it 'has form to add a ride to the mechanics rides' do
    visit "/mechanics/#{@mechanic_1.id}"


  end
end
