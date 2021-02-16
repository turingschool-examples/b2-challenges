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
  end
end
