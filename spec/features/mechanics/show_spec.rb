require "rails_helper"

RSpec.describe 'the mechanics show page', type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', experience: 11)
    @mechanic_3 = Mechanic.create!(name: 'Letty Ortiz', experience: 9)
    @ride_2 = Ride.create!(name:'Mind Eraser', rating: 8, open: true)
  end

  it 'shows a mechanics attributes the names of all rides they’re working on' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)

    visit "/mechanics/#{@mechanic_3.id}"

    expect(page).to have_content(@mechanic_3.name)
    expect(page).to have_content(@mechanic_3.experience)
  end

  it 'displays the names of all rides a mechanic is working on' do
    m2 = @ride_2.mechanics.create!(name: 'Jo Olson', experience: 4)


    visit "/mechanics/#{m2.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)
    expect(page).to have_content('Currently working on: Mind Eraser')
  end
end

#for open rides:
 # if params[:open].open?
  #do stuff
#else
  #do stuff

#def open?
    #where(open: true)
#end
