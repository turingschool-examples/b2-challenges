require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it {should have_many(:ride_mechanics).dependent(:destroy)}
    it {should have_many(:mechanics).through(:ride_mechanics)}
    it {should belong_to :amusement_park}
  end

  describe 'class methods' do
    before :each do
      @hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)
      @tea_cups = @hershey.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true)
      @tot = @hershey.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true)
      @swings = @hershey.rides.create!(name: 'The Swings', thrill_rating: 5, open: true)
      @strawberry = @hershey.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false)
    end

    describe '::by_thrill_rating' do
      it 'returns rides ordered by thrill rating, with highest first' do
        expect(Ride.by_thrill_rating).to eq [@tot, @swings, @strawberry, @tea_cups]
      end
    end

    describe '::by_name' do
      it 'returns rides ordered by name, alphabetically' do
        expect(Ride.by_name).to eq [@strawberry, @swings, @tea_cups, @tot]
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
