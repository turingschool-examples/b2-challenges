require 'rails_helper'

RSpec.describe "Mechanics index page", type: :feature do
  describe 'As a user, when I visit the index page' do
    it "I can see a list of all mechanics's names and years of experience" do
      mech1 = Mechanic.create!(
        name: "Bob",
        years_experience: 12
      )
      mech1 = Mechanic.create!(
        name: "Bobette",
        years_experience: 15
      )

      visit '/mechanics'

      expect(page).to have_content("Bob")
      expect(page).to have_content("Bobette")
      expect(page).to have_content("12")
      expect(page).to have_content("15")
    end

    it 'I can see an average of all the years of experience for mechanics' do
      mech1 = Mechanic.create!(
        name: "Bob",
        years_experience: 12
      )
      mech1 = Mechanic.create!(
        name: "Bobette",
        years_experience: 15
      )

      visit 'mechanics'

      expect(page).to have_content("Average years of experience for all mechanics: 13.5")
    end

  it 'I can see a list of all the rides each mechanic is working on and those rides must be open' do
    mech1 = Mechanic.create!(
      name: "Bob",
      years_experience: 12
    )
    mech2 = Mechanic.create!(
      name: "Bobette",
      years_experience: 15
    )
    ride1 = Ride.create!(
      name: "Holy Terror of Babel",
      thrill_rating: 8,
      open: true
    )
    ride2 = Ride.create!(
      name: "REGRETABLE9000",
      thrill_rating: 2,
      open: true
    )
    ride3 = Ride.create!(
      name: "No More Limbs",
      thrill_rating: 4,
      open: true
    )
    ride4 = Ride.create!(
      name: "Last Will and Testament",
      thrill_rating: 3,
      open: false
    )
    mech1.rides << ride1
    mech1.rides << ride2
    mech2.rides << ride3
    mech2.rides << ride4

    visit '/mechanics'
    expect(page).to have_content("Holy Terror of Babel")
    expect(page).to have_content("REGRETABLE9000")
    expect(page).to have_content("No More Limbs")
    end
  end
end
