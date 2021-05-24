require 'rails_helper'

RSpec.describe 'Mechanic Features' do

  before(:each) do
    @mech1 = Mechanic.create!(name: Faker::Name.name, years_experience: 5)
    @mech2 = Mechanic.create!(name: Faker::Name.name, years_experience: 10)
    @mech3 = Mechanic.create!(name: Faker::Name.name, years_experience: 15)
    @mechs = [@mech1, @mech2, @mech3]
    @ride1 = Ride.create!(name: Faker::Game.title, thrill_rating: 1, open: true)
    @ride2 = Ride.create!(name: Faker::Game.title, thrill_rating: 3, open: true)
    @ride3 = Ride.create!(name: Faker::Game.title, thrill_rating: 2, open: false)
    @rides = [@ride1,@ride3,@ride3]
  end

  it 'should show index page' do
    visit '/mechanics'
    expect(page).to have_content 'All Mechanics'
    @mechs.each do |mech|
      expect(page).to have_content(mech.name)
      expect(page).to have_content(mech.years_experience)
    end
    expect(page).to have_content 'Average Years Experience: 10'
  end

  it 'should have show page' do
    @mech1.rides << [@ride1, @ride2, @ride3]
    visit "mechanics/#{@mech1.id}"
    expect(page).to have_content @mech1.name
    expect(page).to have_content @mech1.years_experience
    expect(page).to have_content @ride1.name
    expect(page).to have_content @ride2.name
    expect(page).to have_no_content @ride3.name
    expect(@ride2.name).to appear_before(@ride1.name)
  end
end