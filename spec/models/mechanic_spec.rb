require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @bob = Mechanic.create(name: 'Bob', years_experience: 20)
    @amy = Mechanic.create(name: 'Amy', years_experience: 15)
    @lee = Mechanic.create(name: 'Lee', years_experience: 10)
  end

  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_numericality_of(:years_experience)}
  end

  describe 'class methods' do
    describe '#average_year_experience' do
      it 'returns the average years of all mechanics experience' do
      expect(Mechanic.average_year_experience).to eq(15)
      end
    end
  end
end
