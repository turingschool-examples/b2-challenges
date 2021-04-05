require 'rails_helper'

RSpec.describe Mechanic, type: :model do

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe '.average_exp' do
    it " returns the average experiance of all mechanics" do
      mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)
      mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)

      expect(Mechanic.average_exp).to eq(15.5)

    end
  end


end
