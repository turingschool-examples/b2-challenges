require 'rails_helper'

RSpec.describe "Professor Show Page" do
  describe "As a visitor" do
    before(:each) do
      @snape = Professor.create!(name: "Severaus Snape", age: 43, specialty: "Potions")

      @harry = @snap.students.create!(name: "Harry Potter", age: 11 )
      @ron = @snap.students.create!(name: "Ron Weasley", age: 12 )
      @hermione = @snap.students.create!(name: "Hermione Grainger", age: 11 )
    end

    it "has the professor's name, age and specialty" do
      visit "/professors/#{@snape.id}"

      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@snape.specialty)
    end
    it "has all of the professor's students"
  end
end
Then I see that professor's name, age, and specialty (e.g.