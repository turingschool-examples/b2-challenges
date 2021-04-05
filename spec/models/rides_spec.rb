require "rails_helper"

describe Ride do
  describe "relationships" do
    it {should have_many :mechanics}
    it {should have_many(:mechanics).through(:mechanics_and_rides) }
  end

  describe "class methods" do
    it "Create a test for method to see which rides are open" do
      ride1 = Ride.create!(name: "Spooky Coaster", open: true)
      expect(Ride.open?).to eq(ride1)
    end

    it "Createa test for method to see rides ordered by thrill score" do
      ride1 = Ride.create!(name: 'Spooky Coaster', open: true, thrill_score: 10)
      ride2 = Ride.create!(name: 'Thrill Factory', open: false, thrill_score: 3)
      expect(Ride.order_by_thrill_score).to eq([ride1, ride2])
    end
  end

end
