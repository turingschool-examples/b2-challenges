require 'rails_helper'

RSpec.describe 'mechanic info page' do

  before :all do
    park = AmusementPark.create!(name: "Elitch Gardens", price: 70.00)
    @mech = Mechanic.create!(name: "Sarah", years_experience: 7)
    @ride1 = park.rides.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
    @ride2 = park.rides.create!(name: "Top Rock", open: true, thrill_rating: 3)
    @ride3 = park.rides.create!(name: "Squiggler", open: true, thrill_rating: 5)
    @ride4 = park.rides.create!(name: "Boggler", open: true, thrill_rating: 1)
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

  describe 'add ride functionality' do
    it 'can add a ride to mechanic queue' do
      #Story 3 - Add a park.rides to a Mechanic
      #As a user,
      #When I go to a mechanics show page
      #I see a form to add a ride to their workload
      #When I fill in that field with an id of an existing ride and hit submit
      #I’m taken back to that mechanic's show page
      #And I see the name of that newly added ride on this mechanics show page

      #Add a ride to workload:
      #park.rides Id: _pretend_this_is_a_textfield_
      #Submit
      visit "/mechanics/#{@mech.id}"
      expect(page).not_to have_content @ride3.name
      fill_in "ride_id", with: @ride3.id
      click_button 'Submit'
      expect(current_path).to eq "/mechanics/#{@mech.id}"
      expect(page).to have_content @ride3.name
    end
  end
end
