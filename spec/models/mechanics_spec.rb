require 'rails_helper'

RSpec.describe Mechanic do
  describe "relationships" do
    it {should have_many(:ride_mechanics)}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    @kara = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @alex = Mechanic.create!(name: 'Alex Potter', years_of_experience: 17)
    @brian = Mechanic.create!(name: 'Brian Simpson', years_of_experience: 2)

    @the_hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @spider_man = Ride.create!(name: 'Spider Man', thrill_rating: 9, open: true)
    @twin_dragons = Ride.create!(name: 'Twin Dragons', thrill_rating: 10, open: true)
    #
    # @Ride_Mechanic_1 = RideMechanics.create!(ride: @the_hurler, mechanic: @kara)
    # @Ride_Mechanic_2 = RideMechanics.create!(ride: @twin_dragons, mechanic: @kara)
    # @Ride_Mechanic_3 = RideMechanics.create!(ride: @the_hurler, mechanic: @alex)
    # @Ride_Mechanic_4 = RideMechanics.create!(ride: @the_hurler, mechanic: @brian)
    # @Ride_Mechanic_5 = RideMechanics.create!(ride: @spider_man, mechanic: @brian )
    # @Ride_Mechanic_5 = RideMechanics.create!(ride: @twin_dragons, mechanic: @brian)
  end

  describe "class methods" do
    describe "::average_years_of_experience" do
      it "finds mechanics average years of experience" do

      expect(Mechanic.average_years_of_experience).to eq(10)
      end
    end
  end
end
