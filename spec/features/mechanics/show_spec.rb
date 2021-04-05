require 'rails_helper'

RSpec.describe 'Mechanic show page' do
  before :each do
    @hurler = Ride.create!(name: 'The Hurler', rating: 7, open: true)
    @carousel = Ride.create!(name: 'Magical Carousel', rating: 1, open: false)
    @swings = Ride.create!(name: 'Wild Swings', rating: 5, open: true)

    @jones = Mechanic.create!(name: 'Pat Jones', experience: 3)
    @smith = Mechanic.create!(name: 'Jaime Smith', experience: 5)
  end

  it 'lists the mechanic names, years experience and rides worked on' do
    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content(@jones.name)
    expect(page).to have_content(@jones.experience)

    expect(page).to have_content(@jones.rides)
  end

end
