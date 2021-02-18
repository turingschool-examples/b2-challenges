require 'rails_helper'

RSpec.describe "professors show page", type: :feature do
  describe "As a visitor" do
    it "I can see the specific professor and its attributes" do
      professor = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
      student1 = professor.students.create!(name: "Harry", age: 18)
      student2 = professor.students.create!(name: "Ron", age: 18)

      visit "/professors/#{professor.id}"

      expect(page).to have_content(professor.name)
      expect(page).to have_content(professor.age)
      expect(page).to have_content(professor.specialty)
      expect(page).to have_content(student1.name)
      expect(page).to have_content(student2.name)



    end
  end
end