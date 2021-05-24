require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it {should belong_to :mechanic}
    it {should belong_to :park}
  end

  before :each do
    @mechanic1 = Mechanic.create!(name: "Bob Jones", years_experience: 12)
    @park = Park.create!(name: "Six Flags Great Adventure", admission_price: 49.99)

    @ride1 = @mechanic1.rides.create!(name: "Teacups", thrill_rating: 3, open: true, park_id: @park.id)
    @ride2 = @mechanic1.rides.create!(name: "Twirl-a-whirl", thrill_rating: 7, open: true, park_id: @park.id)
    @ride3 = @mechanic1.rides.create!(name: "Skull Mountain", thrill_rating: 9, open: false, park_id: @park.id)
  end

  describe 'class methods' do
    it '#open_rides_by_thrill returns a list of open rides sorted by thrill rating' do
      expect(Ride.open_rides_by_thrill).to eq([@ride2, @ride1])
      expect(@mechanic1.rides.open_rides_by_thrill).to eq([@ride2, @ride1])
    end

    it '#rides_by_name returns rides in alphabetical order' do
      expect(Ride.rides_by_name).to eq([@ride3, @ride1, @ride2])
    end

    it '#avg_thrill returns average thrill rating for a collection of rides, rounded to 2' do
      expect(Ride.avg_thrill).to eq(6.33)
    end
  end
end
