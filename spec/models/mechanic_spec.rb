require 'rails_helper'

describe 'Mechanic' do
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