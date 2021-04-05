require 'rails_helper'

RSpec.describe Mechanic do
  describe "relationships" do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    @kara = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @alex = Mechanic.create!(name: 'Alex Potter', years_of_experience: 17)
    @brian = Mechanic.create!(name: 'Brian Simpson', years_of_experience: 2)
  end

  describe "class methods" do
    describe "::average_years_of_experience" do
      it "finds mechanics average years of experience" do

      expect(Mechanic.average_years_of_experience).to eq(10)
      end
    end
  end
end
