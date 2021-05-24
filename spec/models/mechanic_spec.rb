require 'rails_helper'

RSpec.describe Mechanic do

  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'functions' do
    it 'returns average years of experience' do
      @mech = Mechanic.create!(name: "Marty", years_experience: 3)
      @mech2 = Mechanic.create!(name: "Gregor", years_experience: 15)
      @mech3 = Mechanic.create!(name: "Sarah", years_experience: 7)
      expected_average = (3 + 15 + 7) / 3.to_f
      expect(Mechanic.all.avg_exp).to eq expected_average.round
    end

    it 'returns only open rides sorted by importance' do
      @mech = Mechanic.create!(name: "Sarah", years_experience: 7)
      @ride1 = Ride.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
      @ride2 = Ride.create!(name: "Top Rock", open: true, thrill_rating: 3)
      @ride4 = Ride.create!(name: "Boggler", open: true, thrill_rating: 1)
      @mech.rides << @ride1
      @mech.rides << @ride2
      @mech.rides << @ride4
      expect(@mech.open_important_rides).to eq([@ride2, @ride4])
    end
  end
end
