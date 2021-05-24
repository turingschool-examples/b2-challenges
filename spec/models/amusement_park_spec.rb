require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end
  describe '#average_thrill' do
    it "returns the average thrill of all rides" do
      amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
      ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '8', open: 'false')
      ride_2 = amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
      ride_3 = amusement_park.rides.create!(name: 'Throttle', thrill_rating: '5', open: 'true')

      expect(amusement_park.average_thrill).to eq(5.0)
    end
  end
end
