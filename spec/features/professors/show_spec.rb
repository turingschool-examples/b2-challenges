require 'rails_helper'

RSpec.describe "Professor Show Page" do
  describe "As a visitor" do
    before(:each) do
      @snape = Professor.create!(name: "Severaus Snape", age: 43, specialty: "Potions")
      
      @harry = @snape.students.create!(name: "Harry Potter", age: 11 )
      @ron = @snape.students.create!(name: "Ron Weasley", age: 12 )
      @hermione = @snape.students.create!(name: "Hermione Grainger", age: 11 )
    end

    it "has the professor's name, age and specialty" do
      visit "/professors/#{@snape.id}"
      
      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@snape.specialty)
    end
    it "has all of the professor's students" do
      visit "/professors/#{@snape.id}"
      
      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@ron.name)
      expect(page).to have_content(@hermione.name)
    end
  end
end
