require 'rails_helper'

describe 'Mechanic', type: :model do
  describe 'relationships' do
    xit{should have_many(:mechanic_rides)}
    xit{should have_many(:rides).through(:mechanic_rides)}
  end
  describe 'class methods' do
    describe '.average_experience' do
      it 'calculates the average experience of mechanics' do
                Mechanic.create!(name:'Tim', experience: 12)
        Mechanic.create!(name:'Jill', experience: 16)
        Mechanic.create!(name:'Steve', experience: 4)

        expect(Mechanic.average_experience).to eq 10.67

      end
    end

    describe 'instance methods' do
      describe '#rides working on' do
        it 'displays the rides being worked on' do
          tim = Mechanic.create!(name:'Tim', experience: 12)
          scrambler = Ride.create!(name:'Scrambler', open: false, thrill_rating: 5)
          rambler = Ride.create!(name:'Rambler', open: true, thrill_rating: 6)
          ambler = Ride.create!(name:'Ambler', open: true, thrill_rating: 7)
          MechanicRide.create!(mechanic: tim, ride: scrambler)
          MechanicRide.create!(mechanic: tim, ride: rambler)
          MechanicRide.create!(mechanic: tim, ride: ambler)

          expect(tim.rides_working_on).to eq ([ambler, rambler])
        end
      end
    end
  end
end