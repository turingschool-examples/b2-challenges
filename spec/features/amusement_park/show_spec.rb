require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'show page' do
    it "shows their attributes & the rides at the park" do
      # Extension - Amusement Park Show page
      # As a visitor,
      # When I visit an amusement park’s show page
      # I see the name and price of admissions for that amusement park
      # And I see the names of all the rides that are at that theme park listed in alphabetical order
      # And I see the average thrill rating of this amusement park’s rides
      # Ex: Hershey Park
      #    Admissions: $50.00
      #
      #    Rides:
      #           1. Lightning Racer
      #           2. Storm Runner
      #           3. The Great Bear
      #    Average Thrill Rating of Rides: 7.8/10
      #
      # Note: You may have to make new migrations for this story

      amusement_park = AmusementPark.create!(name: 'DisneyWorld', price_of_admission: 100)
      ride_1 = amusement_park.rides.create!(name: 'Rockin Roller Coaster', thrill_rating: 8, open: true)
      ride_2 =  amusement_park.rides.create!(name: 'Tower of Terror', thrill_rating: 9, open: true)
      ride_3 = amusement_park.rides.create!(name: 'Teacup Ride', thrill_rating: 2, open: false)

      visit "/amusement_parks/#{amusement_park.id}"

      expect(page).to have_content(amusement_park.name)
      expect(page).to have_content(amusement_park.price_of_admission)
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
    end
  end
end
