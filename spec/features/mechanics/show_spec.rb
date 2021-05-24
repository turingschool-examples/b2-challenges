require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create!(name: "Bob Jones", years_experience: 12)

    @ride1 = @mechanic1.rides.create!(name: "Teacups", thrill_rating: 3, open: true)
    @ride2 = @mechanic1.rides.create!(name: "Twirl-a-whirl", thrill_rating: 7, open: true)
    @ride3 = @mechanic1.rides.create!(name: "Skull Mountain", thrill_rating: 9, open: false)

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
end
