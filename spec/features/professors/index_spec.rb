require "rails_helper"

RSpec.describe "Professor index page" do
  before :each do
    Professor.destroy_all
    Student.destroy_all
    ProfessorStudent.destroy_all

    @professor1 = Professor.create!(name: "Professor Snape", age: 65, specialty: "Magic")
    @professor2 = Professor.create!(name: "Professor Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @professor3 = Professor.create!(name: "Professor Orf", age: 30, specialty: "Levitatin")
  end

  it "can see the name of each professor and a link to update a professors info" do
    visit "/professors"

    expect(page).to have_content("All Professors")
    expect(page).to have_content(@professor1.name)
    expect(page).to have_content(@professor2.name)
    expect(page).to have_content(@professor3.name)
    expect(page).to have_link("Update")

    click_link("Update")

    expect(page).to have_content("Update Professor")

    fill_in("name", with: "Professor Wizard")
    fill_in("age", with: 20)
    fill_in("specialty", "Casting Spells")

    click_button("Submit")

    expect(current_path).to eq("/professors")
  end
end
