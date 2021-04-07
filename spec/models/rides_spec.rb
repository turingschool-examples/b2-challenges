require "rails_helper"

describe Ride, type: :model do

  describe "relationships" do
    it {should have_many(:mechanics_and_rides)}
    it {should have_many(:mechanics).through(:mechanics_and_rides)}
  end
end
