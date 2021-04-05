require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
  end

  before :each do
    @ride_1 = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @ride_2 = Ride.create!(name: 'Free Fall', thrill_rating: 9, open: true)
    @ride_3 = Ride.create!(name: 'Big Splash', thrill_rating: 3, open: true)
  end

  describe 'class methods' do
    describe '#open_rides' do
      it 'can see only rides that are open' do
        expect(Ride.open_rides).to eq([@ride_2, @ride_3])
      end 
    end
  end

  describe 'instance methods' do
  end
end
