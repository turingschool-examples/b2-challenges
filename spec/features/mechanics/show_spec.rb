require 'rails_helper'

RSpec.describe 'the mechanics show' do
  before(:each) do
    @bob = Mechanic.create(name: 'Bob', years_experience: 20)
    @amy = Mechanic.create(name: 'Amy', years_experience: 15)
    @lee = Mechanic.create(name: 'Lee', years_experience: 10)
    @hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @spinner = Ride.create!(name: 'The Spinner', thrill_rating: 5, open: true)
    @elevator = Ride.create!(name: 'The Elevator', thrill_rating: 10, open: true)
    @RideMechanic.create!(ride: hurler, mechanic:lee)
    @RideMechanic.create!(ride: hurler, mechanic:amy)
    @RideMechanic.create!(ride: hurler, mechanic:bob)
    @RideMechanic.create!(ride: spinner, mechanic:bob)
    @RideMechanic.create!(ride: elevator, mechanic:bob)
  end

  it "shows a mechanic and all of it's attributes including rides associated" do
    visit "/mechanics/#{@bob.id}"

    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@bob.years_experience)
    expect(page).to have_content(@spinner.name)
    expect(page).to have_content(@elevator.name)
  end
