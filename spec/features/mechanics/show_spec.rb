RSpec.describe "When I visit mechanics show page" do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Olafur', years_experience: 5)
    @ride_1 = @mechanic_1.rides.create!(name: "Anaconda", thrill_rating: 6, open: true)
    @ride_2 = @mechanic_1.rides.create!(name: "Superman", thrill_rating: 7, open: true)
    @ride_3 = @mechanic_1.rides.create!(name: "Millenium Force", thrill_rating: 10, open: true)
  end   
 it 'I see the name, years of experience, and all the rides they work on' do
     visit mechanic_path(@mechanic_1)

    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content("Mechanic: Olafur")
    expect(page).to have_content("Years of Experience: 5")
    expect(page).to have_content("Current rides they are working on:")
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)

    expect(@ride_3.name).to appear_before(@ride_2.name)
    expect(@ride_2.name).to appear_before(@ride_1.name)
 end
end
    
