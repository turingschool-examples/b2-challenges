require 'rails_helper'

RSpec.describe 'Mechanics index page' do 
  it "Has a header that says'All Mechanics'" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it "Has a list of all mechanics listing their names and years of experience" do
    bob = Mechanic.create!(name: "Bob", experience: 5)
    rob = Mechanic.create!(name: "Rob", experience: 2)
    tob = Mechanic.create!(name: "Tob", experience: 15)

    visit '/mechanics'
    
    expect(page).to have_content("Name: #{bob.name}")
    expect(page).to have_content("Experience: #{bob.experience}")
    expect(page).to have_content("Name: #{rob.name}")
    expect(page).to have_content("Experience: #{rob.experience}")
    expect(page).to have_content("Name: #{tob.name}")
    expect(page).to have_content("Experience: #{tob.experience}")
  end
  
  it "Displays the average years of experience across all mechanics" do
    bob = Mechanic.create!(name: "Bob", experience: 5)
    rob = Mechanic.create!(name: "Rob", experience: 2)
    tob = Mechanic.create!(name: "Tob", experience: 14)
  
    visit '/mechanics'

    expect(page).to have_content("Average Years Experience: 7")
  end
end