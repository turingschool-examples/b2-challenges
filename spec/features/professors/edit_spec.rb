require 'rails_helper'

RSpec.describe "Professor Edit Page" do
  it "should display  Professors and Atrributes to be updated" do
    Professor.destroy_all
    Student.destroy_all
    mulan = Professor.create(name: "Mulan Senior", age: 25, specialty: "Flying")
    jen = Professor.create(name: "Emi Star", age: 34, specialty: "Potions")

    d = Student.create(name: "Dmytri Nguyen", age: 6)
    l = Student.create(name: "Lana Nguyen", age: 4)
    k = Student.create(name: "Khoa Nguyen", age: 35)

    ProfessorStudent.create(professor: mulan, student: k)
    ProfessorStudent.create(professor: mulan, student: l)
    ProfessorStudent.create(professor: mulan, student: d)
    ProfessorStudent.create(professor: jen, student: l)
    ProfessorStudent.create(professor: jen, student: d)

    visit '/professors'

    expect(page).to have_link("Update Mulan Senior")
    click_link("Update Mulan Senior")

    expect(current_path).to eq("/professors/#{mulan.id}/edit")

    fill_in "name", with: "Update Name"
    fill_in "age", with: "10000"
    fill_in "specialty", with: "Infinite"

    expect(page).to have_button("Update Professor")
    click_button("Update Professor")

    expect(current_path).to eq("/professors")

    expect(page).to have_content("Update Name")
    expect(page).to have_content("10000")
    expect(page).to have_content("Infinite")

  end
end
