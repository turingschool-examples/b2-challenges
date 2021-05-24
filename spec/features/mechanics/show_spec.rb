require 'rails_helper'

RSpec.describe Mechanic, type: :feature do
  describe '#show' do
    it 'shows mechanic with same id' do
      mechanic = Mechanic.create!(name: 'Jim Bob', years_experience: 10)

      visit "mechanics/#{mechanic.id}"

      expect(page).to have_content('Jim Bob')
      expect(page).to have_content(10)
    end

    it 'shows the current rides their working on that are open' do
      mechanic = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
      ride_1 = Ride.create!(name: "Whip Around", thrill_rating: 6, open: true)
      ride_2 = Ride.create!(name: "Whiz Bang", thrill_rating: 8, open: false)
      ride_3 = Ride.create!(name: "Wowza!", thrill_rating: 9, open: true)

      mechanic.rides << ride_1
      mechanic.rides << ride_2
      mechanic.rides << ride_3

      visit "mechanics/#{mechanic.id}"

      expect(page).to have_content("Whip Around")
      expect(page).to have_content(6)
      expect(page).to have_content("Wowza!")
      expect(page).to have_content(9)
      expect(page).to_not have_content("Whiz Bang")
      expect(page).to_not have_content(8)
    end
  end
end