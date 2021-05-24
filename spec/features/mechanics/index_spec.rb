require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before :each do
    @hurler = Ride.create!(name: 'The Hurler', rating: 7, open: true)
    @jones = Mechanic.create!(name: 'Pat Jones', experience: 3)
    @smith = Mechanic.create!(name: 'Jaime Smith', experience: 5)
  end

  it 'lists all the mechanics names and years experience' do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(Mechanic.all.average_experience)

    expect(page).to have_content(@jones.name)
    expect(page).to have_content(@jones.experience)

    expect(page).to have_content(@smith.name)
    expect(page).to have_content(@smith.experience)
  end

end
