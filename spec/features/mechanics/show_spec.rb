require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Bob Jones", years_experience: 12)
    @park = Park.create!(name: "Six Flags Great Adventure", admission_price: 49.99)

    @ride1 = @mechanic1.rides.create!(name: "Teacups", thrill_rating: 3, open: true, park_id: @park.id)
    @ride2 = @mechanic1.rides.create!(name: "Twirl-a-whirl", thrill_rating: 7, open: true, park_id: @park.id)
    @ride3 = @mechanic1.rides.create!(name: "Skull Mountain", thrill_rating: 9, open: false, park_id: @park.id)

    visit "/mechanics/#{@mechanic1.id}"
  end

  it 'shows the mechanic name, years experience, and open rides' do
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_experience)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
  end

  it 'only does not show closed rides' do
    expect(page).to_not have_content(@ride3.name)
  end

  it 'lists rides descending in order of thrill' do
    expect(@ride2.name).to appear_before(@ride1.name)
  end

  it 'has a form to add a new ride to that mechanic taking ride id' do
    expect(page).to have_content("Add a ride to workload:")
    expect(page).to have_field(:ride_id)
    expect(page).to have_button("Submit")
  end

  it 'shows the new ride on the mechanic show page upon submission' do
    @mechanic2 = Mechanic.create!(name: "Sally Fields", years_experience: 23)
    @ride4 = @mechanic2.rides.create!(name: "Medusa", thrill_rating: 9, open: true, park_id: @park.id)

    fill_in 'ride_id', with: @ride4.id
    click_button 'Submit'

    expect(page).to have_content(@ride4.name)
  end


  it 'does not show rides added that are not open on show page' do
    @mechanic2 = Mechanic.create!(name: "Sally Fields", years_experience: 23)
    @ride4 = @mechanic2.rides.create!(name: "Superman", thrill_rating: 8, open: false, park_id: @park.id)

    fill_in 'ride_id', with: @ride4.id
    click_button 'Submit'

    expect(page).to_not have_content(@ride4.name)
  end

end
