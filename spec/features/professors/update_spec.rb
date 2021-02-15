require 'rails_helper'

RSpec.describe "The Professors update info page" do 
  it "should display 3 required forms to update" do 
    @snape = Professor.create!(name: "Snape", age: 56, specialty: "Potions")

    visit "/professors"

    click_link("Update")

    expect(current_path).to eq("/professors/#{@snape.id}/edit")

    expect(page).to have_content("Update details for Professor #{@snape.name}")

    within("#form") do 
      fill_in "name", with: "Steve"
      fill_in "age", with: "102"
      fill_in "Specialty", with: "Cap"

      click_button("Submit")
    end

    expect(current_path).to eq("/professors")

    within("#professors") do 
      expect(page).to have_content("Name: Steve")
      expect(page).to have_content("Age: 102")
      expect(page).to have_content("Specialty: Cap")
    end
  end
end
