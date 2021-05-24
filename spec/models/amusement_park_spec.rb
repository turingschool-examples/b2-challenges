require 'rails_helper'

RSpec.describe AmusementPark do

  before :all do
    @park = AmusementPark.create!(name: "Elitch Gardens", price: 70.00)
    @ride1 = @park.rides.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
    @ride2 = @park.rides.create!(name: "Top Rock", open: true, thrill_rating: 3)
  end

  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'methods' do
    it 'can order rides alphabetically' do
      expect(@park.ordered_rides).to eq [@ride1, @ride2]
    end

    it 'can return average thrill' do
      avg = (10 + 3) / 2.to_f
      expect(@park.avg_thrill).to eq avg.round
    end

  end
end
