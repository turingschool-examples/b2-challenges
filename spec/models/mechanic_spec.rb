require 'rails_helper'

describe Mechanic, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_experience}
  end

  describe 'Relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many :rides}
  end

  before :each do
    @joe = Mechanic.create!(name: 'Joe', years_experience: 4)
    @dan = Mechanic.create!(name: 'Dan', years_experience: 6)

    @twister = Ride.create!(name: 'Twister', thrill_rating: 7, open: true)
    @ride1 = Ride.create!(name: 'Roundy Round', thrill_rating: 2, open: true)
    @ride2 = Ride.create!(name: 'Gonna Make You Cry', thrill_rating: 9, open: true)
    @ride3 = Ride.create!(name: 'Easy Street', thrill_rating: 1, open: false)
    @ride4 = Ride.create!(name: 'Drop Down', thrill_rating: 8, open: true)
    @ride5 = Ride.create!(name: 'Elevator Thrill', thrill_rating: 8, open: true)
    @ride6 = Ride.create!(name: 'Topsy Turvy', thrill_rating: 6, open: false)
    @ride7 = Ride.create!(name: 'Whirly Whirl', thrill_rating: 5, open: false)

    @joe.rides.push(@ride1, @ride2, @ride3, @ride4)
    @dan.rides.push(@ride5, @ride6, @ride7)
  end

  it "calculates average years experience of all mechanics" do
    expect(Mechanic.average_years_experience).to eq(5)
  end
end
