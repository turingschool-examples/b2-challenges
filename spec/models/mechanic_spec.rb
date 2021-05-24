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
end
