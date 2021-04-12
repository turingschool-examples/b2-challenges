require "rails_helper"

RSpec.describe "mechanic show page", type: :feature do
   before :each do
    @anna = Mechanic.create!(name: 'Anna Allen', years_experience: 9)
    @bradley = Mechanic.create!(name: 'Bradley Driver', years_experience: 10)
    @chelsey = Mechanic.create!(name: 'Chelsey Vise', years_experience: 11)

    @wizzer = Ride.create!(name: 'Wizzer', thrill_rating: 2, ride_open: true)
    @bumper_cars = Ride.create!(name: 'Bumper Cars', thrill_rating: 4, ride_open: true)
    @zoomy = Ride.create!(name: 'Zoomy Death Plunge', thrill_rating: 10, ride_open: true)
    @no_brakes = Ride.create!(name: 'Brakeless Rusty Coaster', thrill_rating: 8, ride_open: false)

    @anna.rides << @wizzer
    @anna.rides << @zoomy
    @anna.rides << @no_brakes

    visit "/mechanics/#{@anna.id}"
   end

  describe "As a visitor, when I visit mechanic show page" do
    it "displays all of the mechanic's name, years experience" do
       expect(page).to have_content(@anna.name)
       expect(page).to have_content(@anna.years_experience)
       expect(page).to_not have_content(@bradley.name)
       expect(page).to_not have_content(@chelsey.name)
    end
  end

  it "displays names of rides each mechanic is working on, but only rides that are open" do
    expect(page).to have_content(@wizzer.name)
    expect(page).to have_content(@zoomy.name)
    expect(page).to_not have_content(@no_brakes.name)
  end

  it "displays rides in order of thrill rating high-to-low" do
    expect(@zoomy.name).to appear_before(@wizzer.name)
  end

  it "has a form to add a ride by ride id" do
    expect(find('form')).to have_content('Ride ID:')
    fill_in :ride_id, with: @bumper_cars.id

    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{@anna.id}")
    expect(page).to have_content("Bumper Cars")
  end
end
