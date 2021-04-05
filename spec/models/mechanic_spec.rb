require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics) }
  end

  before :each do
    @jones = Mechanic.create!(name: 'Pat Jones', experience: 3)
    @smith = Mechanic.create!(name: 'Jaime Smith', experience: 5)
  end

  describe 'class methods' do
    describe '#average_experience' do
      it 'returns average of all mechanics experience' do
        expect(Mechanic.average_experience).to eq([4])
      end
    end
  end

end
