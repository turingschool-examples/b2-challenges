require 'rails_helper'

RSpec.describe "professors index page", type: :feature do
  it 'professors index page' do
    snape = Professor.create!(name: "Severus Snape", age: 60, speciality: "Defense Against the Dark Arts")
    harry = Student.create!(name: "Harry Potter", age: 16)
    ron = Student.create!(name: "Ron Weasley", age: 16)
    draco = Student.create!(name: "Draco Malfoy", age: 16)
    ProfessorStudent.create!(professor: snape, student: harry)
    ProfessorStudent.create!(professor: snape, student: draco)

    visit '/professors'

    expect(page).to have_link("#{snape.name}")
    expect(page).to have_button("Update Professor")
  end
end
