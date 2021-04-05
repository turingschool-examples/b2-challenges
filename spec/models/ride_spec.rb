require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics) }
  end

  describe 'class methods' do
    before(:each) do
      @ride_1 = Ride.create!(name: 'fast', thrill_rating: 5, open: true)
      @ride_2 = Ride.create!(name: 'medium', thrill_rating: 3, open: false)
      @ride_3 = Ride.create!(name: 'slow', thrill_rating: 7, open: true)
    end

    describe '#desc_thrill_rating' do
      it 'orders the rides by thrill rating' do
        expect(Ride.desc_thrill_rating).to eq([@ride_3, @ride_1, @ride_2])
      end
    end
  end
end
