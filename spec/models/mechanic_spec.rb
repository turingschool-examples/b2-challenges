require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'class methods' do
    describe '#average_years' do
      it 'can find the average years of experience of all mechanics' do
        mechanic_1 = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
        mechanic_2 = Mechanic.create!(name: 'Darrel Smith', years_experience: 5)

        expect(Mechanic.average_years).to eq(7.5)
      end
    end

    describe '#sort_thrill' do
      it 'can find sort the rides high to low by thrill rating' do
        mechanic = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
        ride_1 = Ride.create!(name: "Whip Around", thrill_rating: 6, open: true)
        ride_2 = Ride.create!(name: "Whiz Bang", thrill_rating: 8, open: false)
        ride_3 = Ride.create!(name: "Wowza!", thrill_rating: 9, open: true)

        mechanic.rides << ride_1
        mechanic.rides << ride_2
        mechanic.rides << ride_3

        expect(mechanic.rides.sort_thrill.first).to eq(ride_3)
      end
    end
  end
end