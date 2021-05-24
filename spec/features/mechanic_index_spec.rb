require 'rails_helper'

describe "mechanics index page", type: :feature do
  before :each do
    @steve = Mechanic.create!(name: 'Steve', years_experience: 4)
    @bill = Mechanic.create!(name: 'Bill', years_experience: 6)

    @ride1 = Ride.create!(name: 'The Beast', thrill_rating: 5, open: true)
    @ride2 = Ride.create!(name: 'Tornado', thrill_rating: 8, open: true)
    @ride3 = Ride.create!(name: 'The Tower of Terror', thrill_rating: 8, open: false)

    @ride4 = Ride.create!(name: 'Drop Zone', thrill_rating: 3, open: true)
    @ride5 = Ride.create!(name: 'Clown Town', thrill_rating: 7, open: true)
    @ride6 = Ride.create!(name: 'Wheel of fun', thrill_rating: 8, open: false)

    @steve.rides.push(@ride1, @ride2, @ride3)
    @bill.rides.push(@ride4, @ride5, @ride6)

    visit mechanics_path
  end

  it "shows all mechanics" do
    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@steve.name)
    expect(page).to have_content(@steve.years_experience)
    expect(page).to have_content(Mechanic.average_experience_in_years)
  end
end
