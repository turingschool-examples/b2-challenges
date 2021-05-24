
require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many(:ride_mechanics) }
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'open_thrill' do
    it 'returns a list of all open rides a mechanic is working on ordered by thirll rating' do
      amusement_park = AmusementPark.create!(name: 'Typical Type', price: 4.60)
      mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)
      ride_1 = amusement_park.rides.create!(name: 'Twister', thrill_rating: '8', open: 'false')
      ride_2 = amusement_park.rides.create!(name: 'Winder', thrill_rating: '2', open: 'true')
      ride_3 = amusement_park.rides.create!(name: 'Throttle', thrill_rating: '5', open: 'true')
      RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)
      RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)
      RideMechanic.create!(mechanic: mechanic_1, ride: ride_3)

      expect(mechanic_1.open_thrill).to eq([ride_3, ride_2])
    end
  end
end
