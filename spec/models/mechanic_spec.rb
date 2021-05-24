require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'class methods' do
    it '#avg_yrs_exp returns the average of years_experience' do
      @mechanic1 = Mechanic.create!(name: "Bob Jones", years_experience: 12)
      @mechanic2 = Mechanic.create!(name: "Sally Fields", years_experience: 23)
      @mechanic3 = Mechanic.create!(name: "Sal Junior", years_experience: 4)

      expect(Mechanic.avg_yrs_exp).to eq(13.0)
    end
  end
end
