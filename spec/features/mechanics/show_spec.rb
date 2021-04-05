require 'rails_helper'

RSpec.describe 'Mechanic show page' do 
  it "lists the mechanic's name and experience" do
    bob = Mechanic.create!(name: "Bob", experience: 5)
    # ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
    # ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
    # ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: false)

    # bob.rides.push(ride1, ride2, ride3)
    visit "/mechanics/#{bob.id}"
    
    expect(page).to have_content("#{bob.name}")
    expect(page).to have_content("#{bob.experience}")
  end
    
  it "displays all rides that the mechanic is working on that are open" do
    bob = Mechanic.create!(name: "Bob", experience: 5)
    ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
    ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
    ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: false)

    bob.rides.push(ride1, ride2, ride3)

    visit "/mechanics/#{bob.id}"
    
    expect(page).to have_content("#{ride1.name}")
    expect(page).to have_content("#{ride2.name}")
    expect(page).to_not have_content("#{ride3.name}")
  end

  it "has a form to add a ride to the mechanic's show page" do
    bob = Mechanic.create!(name: "Bob", experience: 5)
    ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
    ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
    ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: true)

    bob.rides.push(ride1, ride2)
    visit "/mechanics/#{bob.id}"
    expect(page).to have_button("Add Ride")
    
    fill_in :new_ride, with: "#{ride3.id}"
    click_button "Add Ride"
    
    expect(current_path).to eq("/mechanics/#{bob.id}")
    expect(bob.rides).to eq([ride1, ride2, ride3])
    
    expect(page).to have_content("#{ride1.name}")
    expect(page).to have_content("#{ride2.name}")
    expect(page).to have_content("#{ride3.name}")
  end
end
