require 'rails_helper'

RSpec.describe "Professor Index Page" do
  before(:each) do
    @snape = Professor.create!(name: "Severaus Snape", age: 43, specialty: "Potions")
    @lupin = Professor.create!(name: "Reamus Lupin", age: 43, specialty: "DDA")
  end
  describe "As a visitor" do
    it "lists the names of all of the professors with an update button" do
      visit "/professors"
      
      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@lupin.name)
      
      
      within("#professor-#{@snape.id}") do
        expect(page).to have_button("Update")
      end
    end
    
    describe "when I click the update button" do
      it "has a form to update the professors name, age and specialty" do
        visit "/professors"

        within("#professor-#{@snape.id}") do
          click_on("Update")
          expect(current_path).to eq(edit_professor_path(@snape))
        end

        expect(page).to have_field(:name)
        expect(page).to have_field(:age)
        expect(page).to have_field(:specialty)
      end
      
      it "updates the record back on the index page" do
        visit "/professors/#{@snape.id}/edit"

        fill_in :name, with: "Snivilling Snape"

        click_on("Submit")
        expect(current_path).to eq(professors_path)

        expect(page).to_not have_content("Severaus Snape")
        
        expect(page).to have_content("Snivilling Snape")
      end
    end
  end
end

