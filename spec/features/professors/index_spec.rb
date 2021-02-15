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

  it "can see the name of each professor" do
    visit "/professors"

    expect(page).to have_content("All Professors")
    expect(page).to have_content(@professor1.name)
    expect(page).to have_content(@professor2.name)
    expect(page).to have_content(@professor3.name)
  end
end
