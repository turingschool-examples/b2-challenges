require 'rails_helper'

RSpec.describe "when i visit /mechanics" do
  it "i see all mechanics listed" do

    mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)
    mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)
    mechanic_3 = Mechanic.create!(name: "roberta", experiance: 5)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.experiance)

    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.experiance)

    expect(page).to have_content(mechanic_3.name)
    expect(page).to have_content(mechanic_3.experiance)
  end

  it "i see average work experiance of all mechanics" do

    mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)
    mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)
    mechanic_3 = Mechanic.create!(name: "roberta", experiance: 5)

    visit "/mechanics"

    expect(page).to have_content(Mechanic.all.average_exp)

  end

  describe "when i visit /mechanics/:id" do
    it "i see all mechanic info " do

      mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)

      ride_1 = Ride.create!(name: "ride_1", thrill_rateing: 1, open: true)
      ride_2 = Ride.create!(name: "ride_2", thrill_rateing: 2, open: true)
      ride_3 = Ride.create!(name: "ride_3", thrill_rateing: 3, open: false)
      ride_4 = Ride.create!(name: "ride_4", thrill_rateing: 4, open: true)


      mechanic_ride_2b = MechanicRide.create!(ride: ride_2, mechanic: mechanic_2)
      mechanic_ride_2d = MechanicRide.create!(ride: ride_4, mechanic: mechanic_2)
      mechanic_ride_2a = MechanicRide.create!(ride: ride_1, mechanic: mechanic_2)


      visit "/mechanics/#{mechanic_2.id}"

      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.experiance)

      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to_not have_content(ride_3.name)
      expect(page).to_not have_content(ride_4.name)
    end

    # it "i see the rides listed in order of thrill rating"  do
    #   mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)
    #
    #   ride_1 = Ride.create!(name: "ride_1", thrill_rateing: 1, open: true)
    #   ride_2 = Ride.create!(name: "ride_2", thrill_rateing: 2, open: true)
    #   ride_3 = Ride.create!(name: "ride_3", thrill_rateing: 3, open: false)
    #   ride_4 = Ride.create!(name: "ride_4", thrill_rateing: 4, open: true)
    #
    #
    #   mechanic_ride_2b = MechanicRide.create!(ride: ride_2, mechanic: mechanic_2)
    #   mechanic_ride_2d = MechanicRide.create!(ride: ride_4, mechanic: mechanic_2)
    #   mechanic_ride_2a = MechanicRide.create!(ride: ride_1, mechanic: mechanic_2)
    #
    #   expect(ride_2.name).to appear_before(ride_1.name)
    # end

  end


end
