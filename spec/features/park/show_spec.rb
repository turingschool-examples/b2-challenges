require 'rails_helper'

# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides

describe 'parks show page' do
  it 'shows the parks name and admission price, along with all the rides, listed alphabetically, and the average thrill rating' do 
    park = Park.create(name:'Cedar Point', price: 50.00)
    ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false, park_id: park.id)
    ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true, park_id: park.id)
    ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true, park_id: park.id)
    visit "/parks/#{park.id}"
    expect(page).to have_content('Cedar Point')
    expect(page).to have_content(50)
    expect(page).to have_content(6.0)
    expect(page).to have_content('death trap')
    expect(page).to have_content('slow, boring ride')
    expect(page).to have_content('flying death trap')
    expect(page.text.index(ride3.name)).to be < page.text.index(ride2.name)
    expect(page.text.index(ride1.name)).to be < page.text.index(ride3.name)
  end
end