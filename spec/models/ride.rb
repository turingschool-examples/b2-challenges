require 'rails_helper'

RSpec.describe 'ride model' do
  describe 'class methods' do
    it "orders rides from highest thrill rating to lowest" do
      ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
      ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
      ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: false)
      ride4 = Ride.create!(name: "Super Loopdy Loop", thrill_rating: 11, open: false)

      expect(Ride.order_rides_by_thrill).to eq([ride4, ride2, ride1, ride3])
    end
  end
end
