require 'rails_helper'

RSpec.describe Ride, type: :model do
  before(:each) do
    @wizzer = Ride.create!(name: 'Wizzer', thrill_rating: 2, ride_open: true)
    @bumper_cars = Ride.create!(name: 'Bumper Cars', thrill_rating: 4, ride_open: false)
    @zoomy = Ride.create!(name: 'Zoomy Death Plunge', thrill_rating: 10, ride_open: true)
  end

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  # describe 'class methods' do
  # end
end
