require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides) }
  end

  describe 'class methods' do
    before(:each) do
      mech_1 = Mechanic.create!(name: 'bob', years_experience: 10)
      mech_2 = Mechanic.create!(name: 'dod', years_experience: 20)
    end

    describe '#avg_exp' do
      it 'returns average years of exp' do
        expect(Mechanic.avg_exp).to eq(15)
      end
    end
  end
end
