require 'rails_helper'

RSpec.describe Park, type: :model do
  before (:each) do
    @park_1 = Park.create!(name: 'Elitches', admission_price: 20)

    @ride_1 = @park_1.rides.create(name: 'Scrambler', thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create(name: 'Tea Cups', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create(name: 'Log Ride', thrill_rating: 4, open: false)
    @ride_4 = @park_1.rides.create(name: 'Tower of Doom', thrill_rating: 10, open: true)
  end

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'instance methods' do
    describe '#rides_ordered_alphabetically' do
      it 'returns all rides for a park ordered alphabetically' do

        expect(@park_1.rides_ordered_alphabetically).to eq([@ride_3, @ride_1, @ride_2, @ride_4])
      end
    end
    describe '#average_thrill_rating' do
      it 'returns the average thrill rating for all rides for a park' do

        expect(@park_1.average_thrill_rating).to eq(6.0)
      end
    end
  end

  describe 'class methods' do
  end
end
