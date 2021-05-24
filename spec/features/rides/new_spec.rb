require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Jamie', years_experience: 17)
    @ride_1 = @mechanic_1.rides.create!(name: 'Free Fall', thrill_rating: 5, open: true)
    @ride_2 = @mechanic_1.rides.create!(name: 'Tumbler', thrill_rating: 7, open: true)
    @ride_3 = @mechanic_1.rides.create!(name: 'Spinster', thrill_rating: 10, open: false)
    @ride_4 = @mechanic_1.rides.create!(name: 'Roller Coaster', thrill_rating: 9, open: true)
  end

  it 'can create a new workload for mechanic' do
    visit '/rides/new'

    fill_in('Name:', with: 'The Frog Hopper')
    fill_in('Thrill Rating:', with: 3)
    fill_in('Open?', with: true)
    click_button('Submit')

    expect(current_path).to eq("/mechanics/#{@mechanic_1}")
  end
end
