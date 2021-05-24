require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before :each do
    @kassy = Mechanic.create!(name: "Kassy Cooper", years_experience: 10)
    @james = Mechanic.create!(name: "James White", years_experience: 21)
    @brittany = Mechanic.create!(name: "Brittany Counts", years_experience: 15)
    @katie = Mechanic.create!(name: "Katie Parr", years_experience: 22)
  end

  context 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  context 'mechanic experience' do
    it 'can list average years of experience across all mechanics' do

    expect(Mechanic.ave_years).to eq(17)  
    end
  end
end
