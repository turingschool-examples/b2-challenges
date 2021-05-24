require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  before :each do
    @ride_1 = Ride.create!(name: 'The Hurler', rating: 7, open: true)
    @ride_2 = Ride.create!(name: 'Magical Carousel', rating: 1, open: false)
    @ride_3 = Ride.create!(name: 'Wild Swings', rating: 5, open: true)
    @ride_4 = Ride.create!(name: 'Teacups', rating: 2, open: false)


    @mechanic_1 = Mechanic.create!(name: 'Pat Jones', experience: 3)
    @mechanic_2 = Mechanic.create!(name: 'Jaime Smith', experience: 5)

    RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_2)
    RideMechanic.create!(ride: @ride_4, mechanic: @mechanic_2)
  end

  describe 'class methods' do
    describe '#only_open' do
      it 'returns only the open rides' do
        expect(Ride.only_open).to eq(4)
      end
    end
  end
end
