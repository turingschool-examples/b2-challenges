require 'rails_helper'

RSpec.describe 'Amusement Parks show page', type: :feature do
  before :each do
    @mechanic = Mechanic.create!(name: "Bob Jones", years_experience: 12)
    @park = Park.create!(name: "Six Flags Great Adventure", admission_price: 49.99)

    @ride1 = @mechanic.rides.create!(name: "Teacups", thrill_rating: 3, open: true, park_id: @park.id)
    @ride2 = @mechanic.rides.create!(name: "Twirl-a-whirl", thrill_rating: 7, open: true, park_id: @park.id)
    @ride3 = @mechanic.rides.create!(name: "Skull Mountain", thrill_rating: 9, open: false, park_id: @park.id)

    visit "/parks/#{@park.id}"
  end

  it "shows the name and price for the park" do
    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.admission_price)
  end

  it "shows the names of all the rides there in alphabetical order" do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    expect(@ride3.name).to appear_before(@ride1.name)
    expect(@ride1.name).to appear_before(@ride2.name)
  end

  it "shows the avg thrill rating of the parks rides" do
    expect(page).to have_content("Average Thrill Rating of Rides: 6.33/10")
  end
end
