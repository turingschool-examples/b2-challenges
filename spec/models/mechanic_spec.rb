require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  before :each do
    @steve = Mechanic.create!(name: 'Steve', years_experience: 4)
    @bill = Mechanic.create!(name: 'Bill', years_experience: 6)

    @ride1 = Ride.create!(name: 'The Beast', thrill_rating: 5, open: true)
    @ride2 = Ride.create!(name: 'Tornado', thrill_rating: 8, open: true)
    @ride3 = Ride.create!(name: 'The Tower of Terror', thrill_rating: 8, open: false)

    @ride4 = Ride.create!(name: 'Drop Zone', thrill_rating: 3, open: true)
    @ride5 = Ride.create!(name: 'Clown Town', thrill_rating: 7, open: true)
    @ride6 = Ride.create!(name: 'Wheel of fun', thrill_rating: 8, open: false)

    @ride7 = Ride.create!(name: 'Twister', thrill_rating: 9, open: true)

    @steve.rides.push(@ride1, @ride2, @ride3)
    @bill.rides.push(@ride4, @ride5, @ride6)
  end

  describe 'class methods' do
    describe '.average_experience_in_years' do
      it "shows the average years of experience across all mechanics" do
        expect(Mechanic.average_experience_in_years).to eq(5)
      end
    end
  end

  describe 'instance methods' do
    describe '#open_rides_by_thrill_rating' do
      it "shows only rides that are open" do
        expect(@steve.open_rides_by_thrill_rating).to eq([@ride2, @ride1])
        expect(@steve.open_rides_by_thrill_rating).to_not eq([@ride3])
      end
    end

    describe '#added_rides' do
      it "add rides to mechanic" do
        expect(@steve.added_rides(@ride7.id)).to eq([@ride7, @ride2, @ride1])
      end
    end
  end
end
