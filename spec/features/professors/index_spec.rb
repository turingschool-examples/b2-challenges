require 'rails_helper'

describe 'When I visit a professor index page' do
  before :each do
    @professor1 = Professor.create(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @professor2 = Professor.create(name: "Severus Snape", age: 204, specialty: "Potions")
    @professor3 = Professor.create(name: "Alastor Moody", age: 204, specialty: "Defense Against the Dark Arts")
    @student1 = @professor1.students.create(name: "Harry Potter", age: 17)
    @student2 = @professor1.students.create(name: "Ronald Weasley", age: 17)
    @student3 = @professor2.students.create(name: "Hermione Granger", age: 18)
    @student4 = @professor2.students.create(name: "Neville Longbottom", age: 17)
    @professor_students1 = ProfessorStudent.create(professor: @professor2, student: @student1)
    @professor_students2 = ProfessorStudent.create(professor: @professor3, student: @student1)
  end

  it 'I see the name of each professor' do
    visit '/professors'

    expect(page).to have_content("Minerva McGonagall")
    expect(page).to have_content("Severus Snape")
    expect(page).to have_content("Alastor Moody")
  end

  it 'and next to each name I see a link to Edit that professor' do
    visit '/professors'

    expect(page).to have_link("Update Minerva McGonagall")
    expect(page).to have_link("Update Severus Snape")
    expect(page).to have_link("Update Alastor Moody")
  end

  it 'I can click that link to edit and update the professors info' do
    visit '/professors'
    click_link "Update Minerva McGonagall"

    expect(current_path).to eq("/professors/#{@professor1.id}/edit")

    fill_in "name", with: "Mrs. Minerva McGonagall"
    fill_in "age", with: "205"
    fill_in "specialty", with: "Awesomeness"
    click_button "Update"

    expect(current_path).to eq("/professors/#{@professor1.id}")
    expect(page).to have_content("Mrs. Minerva McGonagall")
    expect(page).to have_content("205")
    expect(page).to have_content("Awesomeness")
  end
end
