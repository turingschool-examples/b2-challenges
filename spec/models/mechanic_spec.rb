require 'rails_helper'

RSpec.describe Mechanic do

  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'functions' do
    it 'returns average years of experience' do
      @mech = Mechanic.create!(name: "Marty", years_experience: 3)
      @mech2 = Mechanic.create!(name: "Gregor", years_experience: 15)
      @mech3 = Mechanic.create!(name: "Sarah", years_experience: 7)
      expected_average = (3 + 15 + 7) / 3.to_f
      expect(Mechanic.all.avg_exp).to eq expected_average.round
    end
  end
end
