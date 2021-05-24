require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
    it { should belong_to(:amusement_park) }
  end

  describe 'class methods' do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: 'Bob', years_experience: 3)
      @mechanic_2 = Mechanic.create!(name: 'Mark', years_experience: 6)
      @mechanic_3 = Mechanic.create!(name: 'Mark', years_experience: 7)
    end

    describe '::average_years_experience' do
      it "returns the average years of experience" do
        expect(Mechanic.average_years_experience.round(2)).to eq(5.33)
      end
    end
  end

  describe 'instance methods' do
    before(:each) do
      @mechanic = Mechanic.create!(name: 'Bob', years_experience: 3)
      @ride_1 = @mechanic.rides.create!(name: 'Twister', thrill_rating: 6, open: true)
      @ride_2 = @mechanic.rides.create!(name: 'Ferris Wheel', thrill_rating: 2, open: true)
      @ride_3 = @mechanic.rides.create!(name: 'Zipper', thrill_rating: 9, open: true)
      @ride_4 = @mechanic.rides.create!(name: 'Tower of Doom', thrill_rating: 10, open: false)
    end

    describe 'open rides by thrills' do
      it 'returns rides that are open in descending thrill order' do
        expect(@mechanic.open_rides_by_thrills).to eq([@ride_3, @ride_1, @ride_2])
      end
    end
  end
end
