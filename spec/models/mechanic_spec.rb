#spec/models/mechanic_spec
require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end
  
  describe 'class methods' do
    it '::exp_in_years_average' do
      mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
      mechanic_2 = Mechanic.create!(name: "Bryan", exp_in_years: 5)

      expect(Mechanic.exp_in_years_average).to eq(8)
    end
  end
end
