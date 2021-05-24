require 'rails_helper'

RSpec.describe Ride, type: :model do
  before (:each) do
    @park_1 = Park.create!(name: 'Elitches', admission_price: 20)

    @ride_1 = @park_1.rides.create(name: 'Scrambler', thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create(name: 'Tea Cups', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create(name: 'Log Ride', thrill_rating: 4, open: false)
    @ride_4 = @park_1.rides.create(name: 'Tower of Doom', thrill_rating: 10, open: true)
  end

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
    it {should belong_to :park}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
    describe '#sort_by_thrill_filter_open' do
      it 'sorts the rides by most thrills to least and only returns open rides' do

        expect(Ride.sort_by_thrill_filter_open).to eq([@ride_4, @ride_1, @ride_2])
      end
    end
  end
end
