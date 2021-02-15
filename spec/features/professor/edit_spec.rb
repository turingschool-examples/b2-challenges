require 'rails_helper'

RSpec.describe "professors edit page" do
  before :each do
    @professor1 = Professor.create!(name: "professor 1", age: 45, specialty: "Magic")
    @professor2 = Professor.create!(name: "professor 2", age: 30, specialty: "Math")
  end

  describe "When i visit the professor index page" do
    it "shows an update button next to each professor" do
      visit "/professors"

      within "#professor-#{@professor1.id}" do
        expect(page).to have_link("update_professor_#{@professor1.id}")
        expect(@professor1.name).to appear_before("update_professor_#{@professor1.id}")
      end

      within "#professor-#{@professor2.id}" do
        expect(page).to have_link("update_professor_#{@professor2.id}")
        expect(@professor2.name).to appear_before("update_professor_#{@professor2.id}")
      end
    end

    it "takes you to that professors edit page when the edit link is clicked" do
      visit "/professors"
      click_link "update_professor_#{@professor1.id}"

      expect(current_path).to eq("/professors/#{@professor1.id}/edit")
    end
  end

  describe "when I visit a professors edit page" do
    it "has a form to update the profewssors info" do
      visit "/professors/#{@professor1.id}/edit"

      expect(find_field "name").to have_content(@professor1.name)
      expect(find_field "age").to have_content(@professor1.age)
      expect(find_field "specialty").to have_content(@professor1.specialty)
      expect(page).to have_button("Update")
    end

    it "redirects to the index page when the form is submitted" do
      visit "/professors/#{@professor1.id}/edit"

      fill_field "name", with: "New Professor Name"
      click_button "Update"

      expect(current_path).to eq("/professors")
      within "#professor-#{@professor1.id}" do
        expect(page).to have_content("New Professor Name")
        expect(page).to_not have_content("professor 1")
      end
    end
  end
end
