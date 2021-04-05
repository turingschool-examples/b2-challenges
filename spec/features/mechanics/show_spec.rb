require 'rails_helper'

RSpec.describe 'As a visitor' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Joey", years: 6)
      @mechanic_2 = Mechanic.create!(name: "Bobby", years: 14)
      @mechanic_3 = Mechanic.create!(name: "Annie", years: 23)

      @ride1 = Ride.create!(name: "Tower of Doom", rating: 9, open: true)
      @ride2 = Ride.create!(name: "Chipmunk", rating: 9, open: true)
      @ride3 = Ride.create!(name: "Spider Ride", rating: 7, open: false)
      @ride4 = Ride.create!(name: "Teacups", rating: 4, open: true)
      @ride5 = Ride.create!(name: "Kiddy ride", rating: 2, open: true)

      MechanicRide.create!(mechanic: @mechanic_1, ride: @ride1)
      MechanicRide.create!(mechanic: @mechanic_1, ride: @ride2)
      MechanicRide.create!(mechanic: @mechanic_1, ride: @ride3)
      MechanicRide.create!(mechanic: @mechanic_2, ride: @ride3)
      MechanicRide.create!(mechanic: @mechanic_3, ride: @ride3)
      MechanicRide.create!(mechanic: @mechanic_3, ride: @ride1)
      MechanicRide.create!(mechanic: @mechanic_3, ride: @ride4)
    end

    describe "When I go to a mechanics show page" do
    it "I see their name, years of experience, and names of all rides they’re working on" do

      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years)
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to have_content(@ride3.name)
    end

    # it "I’m taken back to that mechanic's show page and I see the name of that newly added ride on this mechanics show page" do
    #   visit mechanic_path(@mechanic_1)
    #
    #   expect(page).to have_content("Add a ride to workload:")
    #   within ".add-ride" do
    #     fill_in 'ride_id', with: @ride4.id
    #     expect(page).to have_button("Submit")
    #     click_on 'Submit'
    #   end
    #
    #   expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    #
    #   expect(page).to have_content(@ride4.name)
    # end
  end
end
