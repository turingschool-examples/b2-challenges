require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many(:ride_mechanics).dependent(:destroy)}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    describe '::avg_years_experience' do
      it 'returns the average years experience of all mechanics' do
        jim = Mechanic.create!(name: "Jim", years_experience: 17)
        xena = Mechanic.create!(name: "Xena", years_experience: 23)

        expect(Mechanic.avg_years_experience).to eq 20
      end
    end
  end
end
