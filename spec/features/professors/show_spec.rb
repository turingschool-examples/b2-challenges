require 'rails_helper'

RSpec.describe 'show page' do
  before :each do
    @prof_1 = Professor.create!(name: "Zeal", age: 5, speciality: "Bug Magic")
    @prof_2 = Professor.create!(name: "Alfol", age: 7, speciality: "Aloe Magic")

    @stu_1 = Student.create!(name: "Zyrn", age: 2)
    @stu_2 = Student.create!(name: "Foles", age: 3)
    @stu_3 = Student.create!(name: "Jorn", age: 2)
    @stu_4 = Student.create!(name: "Holle", age: 4)
    @prof_1_stu_1 = ProfessorStudent.create!(professor: @prof_1, student: @stu_1)
    @prof_1_stu_2 = ProfessorStudent.create!(professor: @prof_1, student: @stu_2)
    @prof_2_stu_3 = ProfessorStudent.create!(professor: @prof_2, student: @stu_3)
    @prof_2_stu_4 = ProfessorStudent.create!(professor: @prof_2, student: @stu_4)
  end

  it "when I visit a professor show page, it displays the professor's details along with all their students' names" do
    visit "/professors/#{@prof_1.id}"

    expect(page).to have_content(@prof_1.name)
    expect(page).to have_content(@prof_1.age)
    expect(page).to have_content(@prof_1.speciality)
    expect(page).to have_content(@stu_1.name)
    expect(page).to have_content(@stu_2.name)
    expect(page).to_not have_content(@stu_3.name)
    expect(page).to_not have_content(@stu_4.name)
  end

  it "when I visit a professor show page, it displays the average age of the professor's students" do
    visit "/professors/#{@prof_2.id}"

    expect(page).to have_content("3.0")
  end

  it "when I visit a professor index page and see the name of each professor, I see a link to update "do
    visit "/professors"

    within "#professor-#{@prof_1.id}" do
      expect(page).to have_content(@prof_1.name)
      expect(page).to have_button("Approve")
    end

    expect(page).to have_content(@prof_2.name)


  end
end

# where I can then update and then get back to the index page"
