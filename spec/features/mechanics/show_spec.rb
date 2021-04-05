require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @josie = Mechanic.create!(name: 'Josie', years_of_experience: 3)
    @emmy = Mechanic.create!(name: 'Emmy', years_of_experience: 5)
    @bella = Mechanic.create!(name: 'Bella', years_of_experience: 1)
    @ride1 = Ride.create!(name: 'Spooky Coaster', open: true, thrill_score: 10)
    @ride2 = Ride.create!(name: 'Thrill Factory', open: false, thrill_score: 3)
    @ride3 = Ride.create!(name: 'Jurrasic Journey', open: true, thrill_score: 15)


    MechanicsAndRide.create!(mechanic: @josie, ride: @ride1)
    MechanicsAndRide.create!(mechanic: @emmy, ride: @ride1)
    MechanicsAndRide.create!(mechanic: @bella, ride: @ride1)
    MechanicsAndRide.create!(mechanic: @josie, ride: @ride2)
    MechanicsAndRide.create!(mechanic: @josie, ride: @ride3)
    MechanicsAndRide.create!(mechanic: @emmy, ride: @ride2)
  end
  describe 'I visit a mechanic show page' do
    it 'Then I see their name, years of experience, and rides that they are working on' do
      visit "/mechanics/#{@emmy.id}"
      expect(page).to have_content(@emmy.name)
      expect(page).to have_content(@emmy.years_of_experience)
      expect(page).to have_content(@emmy.rides)
    end

    it 'I can see rides they are working on if they are open' do
      visit "/mechanics/#{@emmy.id}"
      expect(page).to have_content(@ride1.name)
    end

    it 'I see a form to add a new ride' do
      visit "/mechanics/#{@emmy.id}"
      fill_in 'Ride ID' with 3
      click_on 'Submit'
      expect(current_path).to eq("/mechanics/#{@emmy.id}")
      expect(page). to have_content(@ride3)
  end


end
