require 'rails_helper'

RSpec.describe MechanicRide, type: :model do

  describe 'relationships' do
    it {should belong_to :ride}
    it {should belong_to :mechanic}
  end
  describe 'class methods' do
    describe 'can return associated rides' do
      it 'can return associated rides' do
        steve= Mechanic.create!(name: "steve", years_experience: 10)
        whirly= Ride.create!(name: "whirly", thrill_rating: 2, open: true)
        woot= Ride.create!(name: "woot", thrill_rating: 3, open: false)
        MechanicRide.create!(mechanic_id: steve.id, ride_id: whirly.id)
        MechanicRide.create!(mechanic_id: steve.id, ride_id: woot.id)

        expect(MechanicRide.return_associated_rides(steve.id).count).to eq(2)
      end
    end
  end
end