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

  it "can see name and years experience" do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@ride_2.name)
    expect(page).not_to have_content(@ride_1.name)
  end

  it "can see rides in descending order of thrill" do
    visit "/mechanics/#{@mechanic_2.id}"

    expect(@ride_2.name).to appear_before(@ride_3.name)
  end

  it "can see form to add a ride to mechanic" do
    visit "/mechanics/#{@mechanic_1.id}"

    fill_in 'Ride Id', with: "#{@ride_3.id}"
    click_on 'Submit'

    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content("#{@ride_3.name}")
  end
end
