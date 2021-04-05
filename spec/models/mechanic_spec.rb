require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end
  describe 'class methods' do
    describe 'can calculate average years of experience' do
      it 'can return average years of experience' do
        steve= Mechanic.create!(name: "steve", years_experience: 10)
        bob= Mechanic.create!(name: "bob", years_experience: 8)
        joey= Mechanic.create!(name: "joey", years_experience: 9)

        expect(Mechanic.all.avg_years_exp).to eq(9)
      end
    end
  end
end