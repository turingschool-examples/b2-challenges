require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  before :each do
    @ride_1 = Ride.create!(name: 'The Hurler', rating: 7, open: true)
    @mechanic_1 = Mechanic.create!(name: 'Pat Jones', experience: 3)
    @mechanic_2 = Mechanic.create!(name: 'Jaime Smith', experience: 5)
  end

  it 'lists all the mechanics names and years experience' do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(Mechanic.all.average_experience)

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)

    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.experience)
  end

end
