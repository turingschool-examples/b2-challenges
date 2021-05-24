#spec/features/mechanics/show_spec

require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  describe 'display' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
      @hurler = @mechanic_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
      @viking = @mechanic_1.rides.create!(name: "The Viking", thrill_rating: 2, open: true)
      @teacups = @mechanic_1.rides.create!(name: "Spinning Teacup", thrill_rating: 3, open: true)
      @bouncy_house = @mechanic_1.rides.create!(name: "The Bouncy House", thrill_rating: 1, open: false)
      @mechanic_2 = Mechanic.create!(name: "Bryan", exp_in_years: 5)
      @haunted_house = @mechanic_2.rides.create!(name: "Haunted House", thrill_rating: 10, open: true)
    end

    it 'lists mechanic and their attributes' do
      visit "/mechanics/#{@mechanic_1.id}"
   
      expect(page).to have_content("Name")
      expect(page).to have_content("Years of Experience")
      expect(page).to have_content("Currently Working On:")
    end

    it 'lists only rides that are open' do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@viking.name)
      expect(page).to have_content(@teacups.name)
      expect(page).to_not have_content(@bouncy_house.name)
    end

    it 'lists rides from highest thrill level to lowest' do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(@hurler.name).to appear_before(@teacups.name)
      expect(@hurler.name).to appear_before(@viking.name)
      expect(@teacups.name).to appear_before(@viking.name)
    end

    it 'adds ride to application' do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to_not have_content(@haunted_house.id)
      expect(page).to have_content("Add a ride to workload:")
      expect(page).to have_content("Ride ID:")
      
      fill_in "Ride ID:", with: "#{@haunted_house.id}"
      click_on("Add New Ride")
      save_and_open_page
      expect(page).to have_content(@haunted_house.name)
    end
  end
end