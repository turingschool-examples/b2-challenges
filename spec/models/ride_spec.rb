#spec/models/ride_spec
require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it {should belong_to :amusement_park}
    it {should belong_to :mechanic}
  end

  before :each do
    @mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
    @hurler = @mechanic_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: true)
    @viking = @mechanic_1.rides.create!(name: "The Viking", thrill_rating: 2, open: true)
    @teacups = @mechanic_1.rides.create!(name: "Spinning Teacup", thrill_rating: 3, open: true)
    @bouncy_house = @mechanic_1.rides.create!(name: "The Bouncy House", thrill_rating: 1, open: false)
  end

  describe 'class methods' do
    it '::show_only_open' do

      expect(Ride.show_only_open).to eq([@hurler, @viking, @teacups])
    end

    it '::sort_by_thrill_level' do

      expect(Ride.sort_by_thrill_level).to eq([@hurler, @teacups, @viking, @bouncy_house])
    end
  end
end