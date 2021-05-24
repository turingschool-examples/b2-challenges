require 'rails_helper'

RSpec.describe 'the mechanics index' do
  before (:each) do
    @ride_1 = Ride.create(name: 'Scrambler', thrill_rating: 8, open: true)
    @ride_2 = Ride.create(name: 'Tea Cups', thrill_rating: 2, open: false)
    @ride_3 = Ride.create(name: 'Log Ride', thrill_rating: 4, open: true)
    @ride_4 = Ride.create(name: 'Tower of Doom', thrill_rating: 10, open: true)

    @mechanic_1 = Mechanic.create!(name: "Suzie Q", years_experience: 2)
    @mechanic_2 = Mechanic.create!(name: "Jane Doe", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Barak Obama", years_experience: 6)

    @mechanic_ride_1 = MechanicRide.create!(ride: @ride_1, mechanic: @mechanic_1)
    @mechanic_ride_2 = MechanicRide.create!(ride: @ride_2, mechanic: @mechanic_2)
    @mechanic_ride_3 = MechanicRide.create!(ride: @ride_3, mechanic: @mechanic_3)
    @mechanic_ride_4 = MechanicRide.create!(ride: @ride_4, mechanic: @mechanic_3)
  end

  describe 'page appearance' do
    it 'lists the mechanics with their attributes' do
      visit "/mechanics/#{@mechanic_3.id}"

      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_3.years_experience)
    end
    it 'lists the rides the mechanic is working on in order of thrill, highest to lowest' do
      visit "/mechanics/#{@mechanic_3.id}"

      expect(@ride_4.name).to appear_before(@ride_3.name)
    end
    it 'does not list closed rides' do
      visit "/mechanics/#{@mechanic_2.id}"

      expect(page).to_not have_content(@ride_2.name)
    end
  end
  describe 'page functionality' do
    describe 'assigning a ride' do
      it 'should have a form that allows users to enter data to assign a ride' do
        visit "/mechanics/#{@mechanic_2.id}"

        expect(page).to have_content('Assign a Ride to Mechanic')
        expect(page).to have_content('Please enter the ID of the ride below')
      end
      it 'should add a ride to the mechanics assignments when the user enters a ride id' do
        visit "/mechanics/#{@mechanic_2.id}"

        fill_in 'ride_id', with: "#{@ride_4.id}"
        click_button('Assign Ride')

        expect(page).to have_content('Tower of Doom')
      end
    end
  end
end