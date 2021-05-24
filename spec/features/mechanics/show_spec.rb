require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Jamie', years_experience: 17)
    @ride_1 = @mechanic_1.rides.create!(name: 'Free Fall', thrill_rating: 5, open: true)
    @ride_2 = @mechanic_1.rides.create!(name: 'Tumbler', thrill_rating: 7, open: true)
    @ride_3 = @mechanic_1.rides.create!(name: 'Spinster', thrill_rating: 10, open: false)
    @ride_4 = @mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 9, open: true)
  end

  it 'shows a mechanic and their years of experience, and only open rides they are working on' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to_not have_content(@ride_3.name)
    expect(page).to have_content(@ride_4.name)
  end

  it 'shows open rides by descending order' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(@ride_4.name).to appear_before(@ride_2.name)
    expect(@ride_4.name).to appear_before(@ride_1.name)
    expect(@ride_2.name).to appear_before(@ride_1.name)
  end

  it 'can create a new workload for mechanic' do
    visit "/mechanics/#{@mechanic_1.id}"

    fill_in('Ride ID:', with: 5)
    fill_in('Name:', with: 'The Frog Hopper')
    fill_in('Thrill Rating (1-10):', with: 3)
    fill_in('Open? (true or false)', with: true)
    click_button('Submit')

    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content('The Frog Hopper and thrill rating at 3')
  end

end
