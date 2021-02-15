require 'rails_helper'

RSpec.describe "the Professor Index page" do
  it "should display all profesors" do
    @snape = Professor.create!(name: "Snape", age: 56, specialty: "Potions")

    @harry = Student.create!(name: "Harry", age: 15)
    @ron = Student.create!(name: "Ron", age: 16)
    @hermione = Student.create!(name: "Hermione", age: 15)
    @draco = Student.create!(name: "Draco", age: 15)
    @frodo = Student.create!(name: "Frodo", age: 16)
    @marty = Student.create!(name: "Marty", age: 24)
    @samwise = Student.create!(name: "Samwise", age: 13)

    @cl1 = ClassList.create!(professor_id: @snape.id, student_id: @harry.id)
    @cl2 = ClassList.create!(professor_id: @snape.id, student_id: @ron.id)
    @cl3 = ClassList.create!(professor_id: @snape.id, student_id: @hermione.id)
    @cl4 = ClassList.create!(professor_id: @snape.id, student_id: @draco.id)

    visit "/professors/#{@snape.id}"
    within("#professorinfo") do 
      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@snape.specialty)
    end

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@ron.name)
    expect(page).to have_content(@hermione.name)
    expect(page).to have_content(@draco.name)

    expect(page).to have_content("Average age of students: 15.25")
  end
end