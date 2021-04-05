require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe ".average_years" do
    subject {Mechanic.average_years}
    it "should show the mechanics average years of working" do
      joe = Mechanic.create(name: "Joe L", years_experience: 17)
      joaquin = Mechanic.create(name: "Joaquin", years_experience: 23)
      expect(Mechanic.average_years) == 20
    end
  end

  describe "working_rides" do
    subject {Mechanic.working_rides}
    it "shoulw show the rides a mechanic is working on that are open and the thrill rating is ordered by highest rating" do
      joaquin = Mechanic.create(name: "Joaquin", years_experience: 23)

      rockin = Ride.create(name: "Rockin Roller Coaster", thrill_rating: 4, open: true)
      starwars = Ride.create(name: "Star Wars Ride", thrill_rating: 3, open: false)

      MechanicRide.create(mechanic_id: joaquin.id, ride_id: starwars.id)
      MechanicRide.create(mechanic_id: joaquin.id, ride_id: rockin.id)
      expect(should)== Mechanic.working_rides
    end
  end
end
