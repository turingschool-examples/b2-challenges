require 'rails_helper'

RSpec.describe Mechanic do
  describe 'show page' do
    it "shows their attributes & the rides they're working on that are open" do
      mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      mechanic_2 = Mechanic.create!(name: 'Jim Carrey', years_experience: 10)

      ride_1 = Ride.create!(name: 'Rockin Roller Coaster', thrill_rating: 8, open: true)
      ride_2 = Ride.create!(name: 'Tower of Terror', thrill_rating: 9, open: true)
      ride_3 = Ride.create!(name: 'Teacup Ride', thrill_rating: 2, open: false)

      MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
      MechanicRide.create!(mechanic_id: mechanic_2.id, ride_id: ride_2.id)
      MechanicRide.create!(mechanic_id: mechanic_2.id, ride_id: ride_3.id)

      visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_experience)
      expect(page).to have_content(ride_1.name)

      visit "/mechanics/#{mechanic_2.id}"
      
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.years_experience)
      expect(page).to have_content(ride_2.name)
      expect(page).to_not have_content(ride_3.name)
    end
  end
end
