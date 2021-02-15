require 'rails_helper'

RSpec.describe "the Professor Index page" do
  it "should display all profesors" do
    @snape = Professor.create!(name: "Snape", age: 56, specialty: "Potions")
    @lupin = Professor.create!(name: "Lupin", age: 60, specialty: "Defense")
    @hagrid = Professor.create!(name: "Hagrid", age: 45, specialty: "Gamekeeper")

    visit '/professors'
    within("#professors") do 
      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@snape.specialty)
      expect(page).to have_content(@lupin.name)
      expect(page).to have_content(@lupin.age)
      expect(page).to have_content(@lupin.specialty)
      expect(page).to have_content(@hagrid.name)
      expect(page).to have_content(@hagrid.age)
      expect(page).to have_content(@hagrid.specialty)
    end
  end
end