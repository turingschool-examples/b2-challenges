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
  end
end