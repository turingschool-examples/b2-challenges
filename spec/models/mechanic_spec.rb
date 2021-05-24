require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_and_belong_to_many :rides}
  end

  describe 'class method,' do
    describe '#average_experience' do
      it 'returns the average years of experience across all mechanics' do
        Mechanic.create(name: 'Bob', years_experience: 5)
        Mechanic.create(name: 'Mark', years_experience: 10)
        Mechanic.create(name: 'Meggan', years_experience: 3)
        Mechanic.create(name: 'Rich', years_experience: 6)

        expected_avg = 6

        expect(Mechanic.average_experience).to eq expected_avg
      end
    end
  end

  describe 'instance method,' do
    describe '#rides_working_on' do
      before :all do
        @rich = Mechanic.create(name: 'Rich', years_experience: 12)

        @ride_1 = Ride.create(name: Faker::Name.name, thrill_rating: 5, open:true)
        @ride_2 = Ride.create(name: Faker::Name.name, thrill_rating: 8, open:false)
        @ride_3 = Ride.create(name: Faker::Name.name, thrill_rating: 10, open:true)
        @ride_4 = Ride.create(name: Faker::Name.name, thrill_rating: 3, open:true)

        @rich.rides << @ride_1 << @ride_2 << @ride_3 << @ride_4
      end

      after :all do
        Mechanic.destroy_all
        Ride.destroy_all
      end

      it 'returns the list of rides the mechanic is working on' do
        expected_rides = [@ride_3, @ride_1, @ride_4]
        expect(@rich.rides_working_on).to eq expected_rides
      end
    end
  end
end
