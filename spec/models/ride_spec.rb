require 'rails_helper'

describe Ride do
  describe 'relationships' do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe 'display' do
      it 'orders by thrill rating and only displays open rides' do
        scrambler = Ride.create!(name:'Scrambler', open:false, thrill_rating: 5)
        rambler = Ride.create!(name:'Rambler', open: true, thrill_rating: 6)
        ambler = Ride.create!(name:'Ambler', open: true, thrill_rating: 7)
        bler = Ride.create!(name: 'Bler', open: true, thrill_rating: 8)

        expected = Ride.open_by_thrill

        expect(expected.include?(scrambler)).to eq false
        expect(expected).to eq ([bler, ambler, rambler])
      end
    end
   end

end