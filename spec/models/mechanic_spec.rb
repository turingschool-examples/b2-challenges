require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @anna = Mechanic.create!(name: 'Anna Allen', years_experience: 9)
    @bradley = Mechanic.create!(name: 'Bradley Driver', years_experience: 10)
    @chelsey = Mechanic.create!(name: 'Chelsey Vise', years_experience: 11)

    @wizzer = Ride.create!(name: 'Wizzer', thrill_rating: 2, ride_open: true)
    @bumper_cars = Ride.create!(name: 'Bumper Cars', thrill_rating: 4, ride_open: true)
    @zoomy = Ride.create!(name: 'Zoomy Death Plunge', thrill_rating: 10, ride_open: true)
    @no_brakes = Ride.create!(name: 'Brakeless Rusty Coaster', thrill_rating: 8, ride_open: false)

    MechanicRide.create(mechanic: @anna, ride: @wizzer)
    MechanicRide.create(mechanic: @anna, ride: @bumper_cars)
    MechanicRide.create(mechanic: @anna, ride: @zoomy)
    MechanicRide.create(mechanic: @anna, ride: @no_brakes)
  end

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    describe '::average years of experience' do
      it 'calculates the average years of experience of all mechanics' do
        expect(Mechanic.avg_exp).to eq(10)
      end
    end
  end

  # REFACTOR BELOW
  describe 'instance methods' do
    describe '#open_rides' do
      it 'returns open rides' do
        expect(@anna.open_rides).to eq([@wizzer, @bumper_cars, @zoomy])
      end

      it 'does not return rides for other mechanics' do
        expect(@bradley.open_rides).to_not eq([@wizzer, @bumper_cars, @zoomy])
      end
    end

    describe '#open_rides_by_thrill' do
      it 'shows open rides by thrill rating in descending order' do
        expect(@anna.open_rides_by_thrill.to_a).to eq([@zoomy, @bumper_cars, @wizzer])
      end
    end
  end
end
