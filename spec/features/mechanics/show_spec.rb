RSpec.describe "mechanics index page", type: :feature do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'John Doe', years_experience: 5)
    @ride_1 = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @ride_2 = Ride.create!(name: 'Free Fall', thrill_rating: 9, open: true)
    @ride_3 = Ride.create!(name: 'Big Splash', thrill_rating: 3, open: true)
    RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_2)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_2)
  end

  it "can see name and years eaxperience" do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
  end


end
