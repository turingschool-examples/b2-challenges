require 'rails_helper'

RSpec.describe Mechanic do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:years_experience)}
  end

  describe 'relationships' do
    it {should have_many(:ride_mechanics)}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe '#average_experience' do
    it 'returns an average of the years experience column' do
      @mech_1 = Mechanic.create!(name: 'Roald', years_experience: 25)
      @mech_1 = Mechanic.create!(name: 'Larry', years_experience: 10)
      @mech_1 = Mechanic.create!(name: 'Samantha', years_experience: 30)

      expect(Mechanic.average_experience.to_i).to eq(21)
    end
  end
end
