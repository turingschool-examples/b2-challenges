require 'rails_helper'

RSpec.describe "Mechanic Model" do
  describe "class methods" do
    it "averages all mechanics years experience" do
      bob = Mechanic.create!(name: "Bob", experience: 5)
      rob = Mechanic.create!(name: "Rob", experience: 2)
      tob = Mechanic.create!(name: "Tob", experience: 14)

      expect(Mechanic.average_experience).to eq(7)
    end
  end
end