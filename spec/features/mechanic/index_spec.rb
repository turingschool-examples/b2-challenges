require 'rails_helper'

RSpec.describe "mechanics index", type: :feature do
  before :each do
    @steve= Mechanic.create!(name: "steve", years_experience: 10)
    @bob= Mechanic.create!(name: "bob", years_experience: 8)
    @joey= Mechanic.create!(name: "joey", years_experience: 9)
  end
  it "can see all mechanics" do
    
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    within("#avg_years_exp") do 
      expect(page).to have_content(9)
    end
    within("#mechanic-#{@steve.id}") do 
      expect(page).to have_content(@steve.name)
      expect(page).to have_content(10)
    end
    within("#mechanic-#{@bob.id}") do 
      expect(page).to have_content(@bob.name)
      expect(page).to have_content(8)
    end
    within("#mechanic-#{@joey.id}") do 
      expect(page).to have_content(@joey.name)
      expect(page).to have_content(9)
    end
  end

end