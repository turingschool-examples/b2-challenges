require 'rails_helper'

RSpec.describe "professors show page", type: :feature do
  it 'professors show page shows professor and students' do
    snape = Professor.create!(name: "Severus Snape", age: 60, speciality: "Defense Against the Dark Arts")
    harry = Student.create!(name: "Harry Potter", age: 16)
    ron = Student.create!(name: "Ron Weasley", age: 16)
    draco = Student.create!(name: "Draco Malfoy", age: 16)
    ProfessorStudent.create!(professor: snape, student: harry)
    ProfessorStudent.create!(professor: snape, student: draco)
    ProfessorStudent.create!(professor: snape, student: ron)

    visit "/professors/#{snape.id}"

    expect(page).to have_content("#{snape.name}")
    expect(page).to have_content("#{snape.age}")
    expect(page).to have_content("#{snape.speciality}")
    expect(page).to have_content("Students:")
    expect(page).to have_content("#{harry.name}")
    expect(page).to have_content("#{ron.name}")
    expect(page).to have_content("#{draco.name}")
  end

  it 'show page has unenroll button' do
    snape = Professor.create!(name: "Severus Snape", age: 60, speciality: "Defense Against the Dark Arts")
    harry = Student.create!(name: "Harry Potter", age: 16)
    ProfessorStudent.create!(professor: snape, student: harry)
    visit "/professors/#{snape.id}"

    expect(page).to have_button("Unenroll")
    click_button "Unenroll"
    expect(current_path).to eq("/professors/#{snape.id}")
    expect(page).to_not have_content("#{harry.name}")
  end
end
