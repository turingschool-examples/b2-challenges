require 'rails_helper'

RSpec.describe 'Mechanic index page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Bob', years_experience: 3)
    @mechanic_2 = Mechanic.create!(name: 'Mark', years_experience: 6)
  end
  it "shows mechanic attributes" do
    #   Story 1 - Mechanic Index Page
    #   As a user,
    #   When I visit the mechanics index page
    #   I see a header saying “All Mechanics”
    #   And I see a list of all mechanic’s names and their years of experience
    #   And I see the average years of experience across all mechanics
    # end
    visit '/mechanics'
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_experience)
  end

  it "shows the average years of experience " do
    visit '/mechanics'

    expect(page).to have_content("Average years of experience: #{Mechanic.average_years_experience}")

  end
end
