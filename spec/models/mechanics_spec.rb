require "rails_helper"

describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many :rides}
    it {should have_many(:rides).through(:mechanics_and_rides) }
  end

  before :each do
    @josie = Mechanic.create!(name: 'Josie', years_of_experience: 3)
    @emmy = Mechanic.create!(name: 'Emmy', years_of_experience: 5)
    @bella = Mechanic.create!(name: 'Bella', years_of_experience: 1)
    @mechanics = [@josie, @emmy, @bella]
  end

  describe "class methods" do
    describe "::average_years_experience" do
      expect(@mechanics.average_years_experience).to eq(3)
    end
  end



end
