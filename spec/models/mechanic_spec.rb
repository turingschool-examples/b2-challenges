require 'rails_helper'

describe 'Mechanic', type: :model do
  describe 'relationships' do
    it{should have_many(:mechanic_rides)}
    it{should have_many(:rides).through(:mechanic_rides)}
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
  end
end