require "rails_helper"

describe Ride, type: :model do

  describe "relationships" do
    it {should have_many(:mechanics)}
    it {should have_many(:mechanics).through(:mechanics_and_rides) }
    binding.pry
  end

  describe "class methods" do
    describe "::ride_open?" do
      it "Create a test for method to see which rides are open" do
        ride1 = Ride.create!(name: "Spooky Coaster", open: true)
        expect(Ride.ride_open?).to eq(ride1)
      end
    end
  end
end

  #
  #
  #   it "Create a test for method to see rides ordered by thrill score" do
  #     ride1 = Ride.create!(name: 'Spooky Coaster', open: true, thrill_score: 10)
  #     ride2 = Ride.create!(name: 'Thrill Factory', open: false, thrill_score: 3)
  #     expect(Ride.order_by_thrill_score).to eq([ride1, ride2])
  #   end
  # end
