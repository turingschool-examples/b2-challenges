require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'class methods' do
    describe '#sort_thrill' do
      it 'sorts the rides high to low by thrill level' do
        ride_1 = Ride.create!(name: "Whip Around", thrill_rating: 6, open: true)
        ride_2 = Ride.create!(name: "Whiz Bang", thrill_rating: 8, open: false)
        ride_3 = Ride.create!(name: "Wowza!", thrill_rating: 9, open: true)

        expect(Ride.sort_thrill.first).to eq(ride_3)
      end
    end
  end
end