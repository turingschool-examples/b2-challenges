require 'rails_helper'

RSpec.describe "professors edit page", type: :feature do
  it 'professors edit page' do
    snape = Professor.create!(name: "Severus Snape", age: 60, speciality: "Defense Against the Dark Arts")
    harry = Student.create!(name: "Harry Potter", age: 16)
    ron = Student.create!(name: "Ron Weasley", age: 16)
    draco = Student.create!(name: "Draco Malfoy", age: 16)
    ProfessorStudent.create!(professor: snape, student: harry)
    ProfessorStudent.create!(professor: snape, student: draco)

    visit '/professors'

    expect(page).to have_button("Update Professor")
    click_on "Update Professor"
    expect(current_path).to eq("/professors/#{snape.id}/edit")
    fill_in "name", with: "Sniveling Snape"
    fill_in "age", with: 165
    fill_in "speciality", with: "Fart Sniffer"
    click_on "Update #{snape.name}"
    expect(current_path).to eq("/professors")
    expect(page).to have_link("Sniveling Snape")
    click_link "Sniveling Snape"
    expect(current_path).to eq("/professors/#{snape.id}")
    expect(page).to have_content("Sniveling Snape")
    expect(page).to have_content("Age: 165")
    expect(page).to have_content("Specialty: Fart Sniffer")
  end
end
