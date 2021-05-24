require 'rails_helper'

RSpec.describe 'mechanic info page' do

  before :all do
    @mech = Mechanic.create!(name: "Sarah", years_experience: 7)
    @ride1 = Ride.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
    @ride2 = Ride.create!(name: "Top Rock", open: true, thrill_rating: 3)
    @ride3 = Ride.create!(name: "Squiggler", open: true, thrill_rating: 5)
    @ride4 = Ride.create!(name: "Boggler", open: true, thrill_rating: 1)
    @mech.rides << @ride1
    @mech.rides << @ride2
    @mech.rides << @ride4
  end

  describe 'rides mech is working on' do
    it 'conforms with user story' do
      #Story 2 - Mechanic Show Page

      #As a user,
      #When I visit a mechanic show page
      #I see their name, years of experience, and the names of all rides they’re working on
      #And I only see rides that are open
      #And the rides are listed by thrill rating in descending order (most thrills first)
      visit "/mechanics/#{@mech.id}"
      expect(page).to have_content @mech.name
      expect(page).to have_content @mech.years_experience
      expect(page).not_to have_content @ride3.name
      expect(page).to have_content @ride2.name
      expect(page).not_to have_content @ride1.name
      expect(@ride2.name).to appear_before(@ride4.name)
    end

  end

end
