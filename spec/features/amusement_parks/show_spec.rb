#spec/features/amusement_parks/show_spec

require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  describe 'display' do
    before :each do
      @yay_world = AmusementPark.create!(name: "Yay World", price: 18.99)
      @mechanic_1 = @yay_world.mechanics.create!(name: "Ryan", exp_in_years: 11)
      @hurler = @mechanic_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
      @viking = @mechanic_1.rides.create!(name: "The Viking", thrill_rating: 2, open: true)
      @teacups = @mechanic_1.rides.create!(name: "Spinning Teacup", thrill_rating: 3, open: true)
      @bouncy_house = @mechanic_1.rides.create!(name: "The Bouncy House", thrill_rating: 1, open: false)
      @mechanic_2 =  @yay_world.mechanics.create!(name: "Bryan", exp_in_years: 5)
      @haunted_house = @mechanic_2.rides.create!(name: "Haunted House", thrill_rating: 10, open: true)
    end

    it 'lists amusement park and its attributes' do
      visit "/amusementpark/#{@yay_world.id}"
      
      expect(page).to have_content("Yay World")
      expect(page).to have_content("Price: 18.99")
    end
  end
end