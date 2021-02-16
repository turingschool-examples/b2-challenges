require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do

    @professor1 = Professor.create(name: "Minerva McGonagall",
                                  age: 204,
                                  specialty: "Transfiguration",
                                  id: 1,
                                  )

    @student1 = Student.create(name: "Harry Potter",
                          age: 30,
                          id: 1,
                          professor_id: 1,
                          )

    @student2 = Student.create(name: "Ron Weasley",
                          age: 28,
                          id: 2,
                          professor_id: 1
                          )

  end
  describe "When I visit a professor show page" do
    it "Renders the professor's name, and, and specialty" do
      visit '/professors/1'

      expect(page).to have_content("Name: #{@professor1.name}")
      expect(page).to have_content("Age: #{@professor1.age}")
      expect(page).to have_content("Specialty: #{@professor1.specialty}")
      expect(page).to have_content(" #{@student1.name}")
      expect(page).to have_content(" #{@student2.name}")
    end

    it "Renders the average age of the professor's students" do
      visit '/professors/1'
      expect(page).to have_content("Average Student Age: 29")
    end

    it "Render a link 'Update'" do
      visit '/professors/1'
      expect(page).to have_link("Update")
    end

    describe "When I click on the update link" do
      it "Redirects me to the professor/:id/edit page, where I can input a new name, age, and speciality for the professor by clicking a 'submit' button" do
        visit '/professors/1'
        click_link('Update')
        expect(page).to have_current_path("/professors/1/edit")
        expect(page).to have_content("Name")
        expect(page).to have_content("Age")
        expect(page).to have_content("Specialty")
        expect(page).to have_button("submit")
      end
    end

    describe "When I fill in the new fields and click 'submit'" do
      it "Redirects me to the professor/:id page, where I can where I can see the new data that I previously input" do
        visit '/professors/1/edit'
        fill_in "name", with: "Tommy Nieuwenhuis"
        fill_in "age", with: 29
        fill_in "specialty", with: "Making pizza disappear"
        click_button('submit')
        expect(page).to have_current_path("/professors/1")
        expect(page).to have_content("Name: Tommy Nieuwenhuis")
        expect(page).to have_content("Age: 29")
        expect(page).to have_content("Specialty: Making pizza disappear")
      end
    end

  end
end
