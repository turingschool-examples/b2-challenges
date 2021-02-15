require 'rails_helper'

RSpec.describe "Professor Show Page" do
  it "should display all Professors and Atrributes" do
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

    visit "/professors/#{mulan.id}"

    expect(page).to have_content(mulan.name)
    expect(page).to have_content(mulan.age)
    expect(page).to have_content(mulan.specialty)
    expect(page).to have_content(mulan.students.average_age)

    expect(page).to have_button("Unenroll Dmytri")
    click_button("Unenroll Dmytri")
    expect(page).to_not have_content(d.name)
  end
end
