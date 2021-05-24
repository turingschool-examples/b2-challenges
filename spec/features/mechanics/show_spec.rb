require 'rails_helper'

describe 'mechanics show page' do
  before :each do
    @tim = Mechanic.create!(name:'Tim', experience: 12)
    @scrambler = Ride.create!(name:'Scrambler', open: false, thrill_rating: 5)
    @rambler = Ride.create!(name:'Rambler', open: true, thrill_rating: 6)
    @ambler = Ride.create!(name:'Ambler', open: true, thrill_rating: 7)

    MechanicRide.create!(mechanic: @tim, ride: @scrambler)
    MechanicRide.create!(mechanic: @tim, ride: @rambler)
    MechanicRide.create!(mechanic: @tim, ride: @ambler)
    visit "/mechanics/#{@tim.id}"

  end
  it 'displays a mechanics name and age' do
    expect(page).to have_content('Mechanic Name: Tim')
    expect(page).to have_content('Mechanic Experience: 12 years')
  end
  it 'displays the names only of open rides being worked' do
    expect(page).not_to have_content('Tim is working on: Scrambler')
    expect(page).to have_content('Tim is working on: Rambler')
    expect(page).to have_content('Which has a thrill rating of 6')
  end
  it 'displays the rides in descending order of thrill rating' do
    expect('Tim is working on: Ambler').to appear_before('Tim is working on: Rambler')
  end
  it 'contains a form to add a ride to mechanics workload' do
    expect(page).to have_content("Add a ride to Tim's workload")
    expect(find('form')).to have_content('Ride Id')
  end
  it 'adds a ride to workload' do
    @loop = Ride.create!(name:'Loop', open:true, thrill_rating: 10)
    id = @loop.id
    fill_in 'Ride Id', with: id
    click_button 'Add Ride'
    expect(page).to have_content('Tim is working on: Loop')
  end
end