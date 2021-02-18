require 'rails_helper'

RSpec.describe "professors index page", type: :feature do
  describe "as a visitor" do
    describe "displays all the professors" do
      it "has name of each professor" do
        professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        professor2 = Professor.create!(name: "Snape", age: 98, specialty: "Spells")

        visit "/professors"

        expect(page).to have_content(professor1.name)
        expect(page).to have_content(professor2.name)
      end
    end
    describe "each professor has an edit button" do
      it "has link for update" do
        professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
        professor2 = Professor.create!(name: "Snape", age: 98, specialty: "Spells")

        visit "/professors"

        expect(page).to have_link("Update")
      end
      it "clicking link takes to edit path" do
        professor1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")

        visit "/professors"

        click_link "Update"
        expect(current_path).to eq("/professors/professor1.id/edit")
      end
    end
  end
end