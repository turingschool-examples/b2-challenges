require 'rails_helper'

RSpec.describe 'Professor index page' do
  before :each do
    @mcgonagall = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @lupin = Professor.create!(name: "Remus Lupin", age: 45, specialty: "Defence Against the Dark Arts")
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create!(name: "Harry Potter", age:14)
    @draco = Student.create!(name: "Draco Malfoy", age:18)
    @harry_mcgonagall = ProfessorStudent.create!(professor: @mcgonagall, student: @harry)
    @draco_mcgonagall = ProfessorStudent.create!(professor: @mcgonagall, student: @draco)
  end

  it "displays a link to each professors show page" do

    visit "/professors"

    first(:link, @mcgonagall.name).click
    expect(current_path).to eq("/professors/#{@mcgonagall.id}")
    expect(page). to have_content(@mcgonagall.name)
    expect(page). to have_content(@mcgonagall.age)
    expect(page). to have_content(@mcgonagall.specialty)
  end

  it "displays all the professors students" do
      visit "/professors/#{@mcgonagall.id}"
      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@draco.name)
  end

  it "displays the average student age" do
    visit "/professors/#{@mcgonagall.id}"
    expect(page).to have_content("Average Age:16.0")
  end
end
