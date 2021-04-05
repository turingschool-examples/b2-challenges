require 'rails_helper'

RSpec.describe 'Mechanic show page' do 
  it "lists all the mechanis name and experience" do
    bob = Mechanic.create!(name: "Bob", experience: 5)
    ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
    ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
    ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: false)

    bob.rides.push(ride1, ride2, ride3)

    visit '/mechanics/:id'
    
    expect(page).to have_content("#{bob.name}")
    expect(page).to have_content("#{bob.experience}")
    
    it "displays all rides that the mechanic is working on that are open" do
      bob = Mechanic.create!(name: "Bob", experience: 5)
      ride1 = Ride.create!(name: "Mind Eraser", thrill_rating: 7, open: true)
      ride2 = Ride.create!(name: "Twister2", thrill_rating: 8, open: true)
      ride3 = Ride.create!(name: "Loopdy Loop", thrill_rating: 4, open: false)
  
      bob.rides.push(ride1, ride2, ride3)
  
      visit '/mechanics/:id'
      
      expect(page).to have_content("#{ride1}")
      expect(page).to have_content("#{ride2}")
    end
  end
end