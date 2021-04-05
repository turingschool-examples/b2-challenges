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
  
  describe "instance methods" do
    it "only returns the rides that are open" do
      bob = Mechanic.create!(name: "Bob", experience: 5)
      ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
      ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
      ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: false)
      ride4 = Ride.create!(name: "Super Loopdy Loop", thrill_rating: 11, open: false)

      bob.rides.push(ride1, ride2, ride3, ride4)
      expect(bob.mechanics_open_rides).to eq([ride1, ride2])
    end 
  end
end