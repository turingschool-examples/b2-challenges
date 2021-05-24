#spec/features/mechanics/show_spec

require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  describe 'display' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
      @hurler = @mechanic_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
      @viking = @mechanic_1.rides.create!(name: "The Viking", thrill_rating: 5, open: true)
      @teacups = @mechanic_1.rides.create!(name: "Spinning Teacup", thrill_rating: 3, open: true)
      @bouncy_house = @mechanic_1.rides.create!(name: "The Bouncy House", thrill_rating: 1, open: false)

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
    end
  end
end