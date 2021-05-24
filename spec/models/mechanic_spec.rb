require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe '#self.avg_years_experience' do
    it 'averages years of experience' do
      @mechanic_1 = Mechanic.create!(name: 'Jamie', years_experience: 17)
      @mechanic_2 = Mechanic.create!(name: 'Thomas', years_experience: 10)
      @mechanic_3 = Mechanic.create!(name: 'Kelly', years_experience: 26)

      expect(Mechanic.avg_years_experience.round(1)).to eq(17.7)
    end
  end

  describe '#thrill_rating_order_on_open_rides' do
    it 'orders by thrill rating descending' do
      @mechanic_1 = Mechanic.create!(name: 'Jamie', years_experience: 17)
      @ride_1 = @mechanic_1.rides.create!(name: 'Free Fall', thrill_rating: 5, open: true)
      @ride_2 = @mechanic_1.rides.create!(name: 'Tumbler', thrill_rating: 7, open: true)
      @ride_3 = @mechanic_1.rides.create!(name: 'Spinster', thrill_rating: 10, open: false)

      expect(@mechanic_1.thrill_rating_order_on_open_rides.last).to eq(@ride_1)
    end
  end
end
