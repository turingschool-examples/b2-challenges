require 'rails_helper'

RSpec.describe 'Mechanics SHow page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Dee", years_experience: 20)  
    @mechanic_2 = Mechanic.create!(name: "Bob", years_experience: 30) 

    @ride_1 = @mechanic_1.rides.create!(name: 'Whiplash', thrill_rating: 8, open: true)
    @ride_2 = @mechanic_1.rides.create!(name: 'Tea Cups', thrill_rating: 10, open: false)
    @ride_3 = @mechanic_2.rides.create!(name: 'Halfpipe', thrill_rating: 6, open: true)
  end  
  #User Story 2  
  it 'Shows the Mechanics attributes' do
    visit "mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
  end    

  it 'shows the names of all rides mechanics are working on' do
    visit "mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
  end

  it 'shows rides that are open' do
    visit "mechanics/#{@mechanic_1.id}"  

    expect(page).to have_content(@ride_1.name)
    expect(page).to_not have_content(@ride_2.name)
  end

  it 'shows the rides are listed by thrill rating in descending order' do
    visit "mechanics/#{@mechanic_1.id}"    
  end
end