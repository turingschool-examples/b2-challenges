require 'rails_helper'

RSpec.describe Mechanic do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Lois Iddrisu', years_of_experience: 6)
    @mechanic_3 = Mechanic.create!(name: 'Bob Stewart', years_of_experience: 7)

    @ride_3 = Ride.create!(name: 'Goliath', thrill_rating: 10, open: true)
    @ride_4 = Ride.create!(name: 'Super Scream Drop', thrill_rating: 8, open: false)

    @mechanic_1.rides << @ride_3
    @mechanic_1.rides << @ride_4
  end

  describe 'relationships' do
    it {should have_many(:rides).through(:mechanics_rides)}
  end

  it 'can find the average years of experience for all mechanics' do
    expect(Mechanic.average_years_experience).to eq(8)
  end

  it 'can return only the open rides associated with an instance' do
    expect(@mechanic_1.open_rides.length).to eq(1)
  end

  it 'can sort an instances rides by thrill rating' do
    expect(@mechanic_1.sorted_rides_thrill.first).to eq(@ride_3)
    expect(@mechanic_1.sorted_rides_thrill.second).to eq(@ride_4)
  end
end
