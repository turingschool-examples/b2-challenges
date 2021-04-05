require 'rails_helper'

RSpec.describe Ride, type: :model do
  before(:each) do
    @wizzer = Ride.create!(name: 'Wizzer', thrill_rating: 2)
    @bumper_cars = Ride.create!(name: 'Bumper Cars', thrill_rating: 4)
    @zoomy = Ride.create!(name: 'Zoomy Death Plunge', thrill_rating: 10)
  end

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end

  describe 'class methods' do
    describe '#' do
      # it '' do
        # expect().to eq()
      # end
    end
  end
end
