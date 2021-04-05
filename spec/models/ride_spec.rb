require 'rails_helper'

RSpec.describe Ride, type: :model do

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end
  describe 'class methods' do
    describe 'can return open rides' do
      it 'can return average years of experience' do
        whirly= Ride.create!(name: "whirly", thrill_rating: 2, open: true)
        woot= Ride.create!(name: "woot", thrill_rating: 3, open: false)
    

        expect(Ride.all.is_open.count).to eq(1)
      end
    end
    describe 'can return ordered rides' do
      it 'can return ordered rides by thrill' do
        whirly= Ride.create!(name: "whirly", thrill_rating: 2, open: true)
        woot= Ride.create!(name: "woot", thrill_rating: 3, open: false)
    

        expect(Ride.all.ordered[0]).to eq(woot)
        expect(Ride.all.ordered[1]).to eq(whirly)
      end
    end
  end
end