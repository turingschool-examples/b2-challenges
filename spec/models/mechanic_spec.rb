require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before {
    @kon = Mechanic.create!(name: "Kon", years_exp: 4 )
    @ryan = Mechanic.create!(name: "Ryan", years_exp: 1 )
    @joe = Mechanic.create!(name: "Joe", years_exp: 4 )
  }
  describe "class methods" do
    it "Calculates average years experience of all mechanics" do
      average = Mechanic.avg_years_exp

      expect(average).to eq(3)
    end
  end
end
