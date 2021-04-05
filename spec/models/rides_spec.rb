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
  end

end
