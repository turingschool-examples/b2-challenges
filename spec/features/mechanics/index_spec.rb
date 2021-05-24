require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do

#   Story 1 - Mechanic Index Page
#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

  it "Mechanics index page has header" do
    # save_and_open_page
    visit '/mechanics'
    expect(page).to have_content("All Mechanics")
  end

  it "Shows list of mechanics names and years of experience" do
    mechanic_one = Mechanic.create!(name: 'Samantha West', years_of_experience: 5 )
    
    visit '/mechanics'
    save_and_open_page
    expect(page).to have_content(mechanic_one.name)
    expect(page).to have_content(mechanic_one.years_of_experience)
  end

  it "Shows average years of experience" do
    mechanic_one = Mechanic.create!(name: 'Samantha West', years_of_experience: 5 )
    mechanic_two = Mechanic.create!(name: 'Ken Johnson', years_of_experience: 9 )
    visit '/mechanics'

    expect(mechanic_one.years_of_experience).to eq(5)
    expect(Mechanic.total_years_of_experience).to eq(14)
    expect(Mechanic.number_of_mechanics).to eq(2)
    expect(Mechanic.average_years_of_experience).to eq(7)
  end

end
