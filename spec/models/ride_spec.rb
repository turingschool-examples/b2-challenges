require 'rails_helper'

RSpec.describe Ride, type: :model do
  before {
    @tea = Ride.create!(name: "Cups", thrill_rating: 3, is_open: true)
    @kumba = Ride.create!(name: "Kumba", thrill_rating: 8, is_open: true)
  }

  describe "Class Methods" do
    it "Rides are listed by thrill rating descending order" do
      rides = Ride.by_thrill_rating_desc

      expect(rides.first).to eq(@kumba)
    end
  end
end
