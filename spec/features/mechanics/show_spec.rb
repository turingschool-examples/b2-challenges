require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Alan Brown", years_of_experience: 14)
    @mechanic2 = Mechanic.create!(name: "Ziggy Lowe", years_of_experience: 5)
    @ride1 = Ride.create!(name: "Scream", trill_rating: 13, open: true)
    @ride2 = Ride.create!(name: "Cry", trill_rating: 18, open: false)
    @ride3 = Ride.create!(name: "Enjoy", trill_rating: 5, open: true)
    @ride4 = Ride.create!(name: "Yell", trill_rating: 6, open: true)

    MechanicRide.create!(mechanic: @mechanic1, ride: @ride1)
    MechanicRide.create!(mechanic: @mechanic1, ride: @ride2)
    MechanicRide.create!(mechanic: @mechanic1, ride: @ride4)

    visit "/mechanics/#{@mechanic1.id}"
  end

    it 'shows mechanic attributes and their rides' do
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content("Years of experience: #{@mechanic1.years_experience}")
      expect(page).to have_content("Open Rides: #{@ride1.name}, #{@ride2.name}, #{@ride4.name}")
      expect(page).not_to have_content("#{@ride3.name}")
    end

    it 'shows rides are listed by trill rating in descending order (most trills first)' do
      expect(@ride2.name).to appear_before(@ride1.name)
      expect(@ride1.name).to appear_before(@ride4.name)
    end

    it 'shows a form to add a ride to their workload' do
      click_link 'Add a ride'

      expect(current_path).to eq("/mechanics/#{mechanic.id}/rides/#{ride.id}")

      fill_in 'Mechanic', with: 'Kara Smith'
      fill_in 'Years of Experience', with: "11"
      fill_in 'Add a ride to workload:', with: "Crazy frog"

      click_on 'Submit'

      expect(current_path).to eq("/mechanics/#{mechanic.id}/rides")

      expect(page).to have_content('Kara Smith')
      expect(page).to have_content('11')
      expect(page).to have_content('Crazy frog')
      expect(page).not_to have_content('Crazy giraffe')
    end
  end
