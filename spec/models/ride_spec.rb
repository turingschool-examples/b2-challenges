require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many(:ride_mechanics).dependent(:destroy)}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'class methods' do
    before :each do
      @tea_cups = Ride.create!(name: 'The Tea Cups', thrill_rating: 2, open: true)
      @tot = Ride.create!(name: 'Tower of Terror', thrill_rating: 8, open: true)
      @swings = Ride.create!(name: 'The Swings', thrill_rating: 5, open: true)
      @strawberry = Ride.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false)
    end

    describe '::by_thrill_rating' do
      it 'returns rides ordered by thrill rating, with highest first' do
        expect(Ride.by_thrill_rating).to eq [@tot, @swings, @strawberry, @tea_cups]
      end
    end

    describe '::open_only' do
      it 'returns only the open rides' do
        expect(Ride.open_only).to include @tot
        expect(Ride.open_only).to include @tea_cups
        expect(Ride.open_only).to include @swings
        expect(Ride.open_only).to_not include @strawberry
      end
    end
  end
end
