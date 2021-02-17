require 'rails_helper'
describe 'Professor show page' do
  before each: do 
    @student1 = Student.create!(name: "Harry" age: 17)
    @student2 = Student.create!(name: "Hermoine" age: 17)
    @professor = Professor.create!(Name: "Minerva McGonagall", Age: 204, Specialty: "Transfiguration")
    @professor_students = ProfessorStudent.create!(professor: @professor, student: @student1, @student2)
  end
  it 'has professors attributes and students associated' do
    visit '/professors/#{@professor.id}'

    expect(page).to have_content("Minerva McGonagall")
    expect(page).to have_content("204")
    expect(page).to have_content("Transfiguration")
    expect(page).to have_content("Harry")
    expect(page).to have_content("Hermoine")
  end

  it 'shows average age of students' do
    visit '/professors/#{@professor.id}'

    expect(page).to have_content("17")
  end
end