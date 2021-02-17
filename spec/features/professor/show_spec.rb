require 'rails_helper'
describe 'Professor show page' do
  before :each do 
    @professor = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @student1 = Student.create!(name: "Harry", age: 17)
    @student2 = Student.create!(name: "Hermoine", age: 17)
    @harry = @student1.professor_students.create!(professor: @professor, student: @student1)
    @hermoine = @student2.professor_students.create!(professor: @professor, student: @student2)
  end

  it 'has professors attributes and students associated' do
    visit "/professors/#{@professor.id}"

    expect(page).to have_content("Minerva McGonagall")
    expect(page).to have_content("204")
    expect(page).to have_content("Transfiguration")
    expect(page).to have_content("Harry")
    expect(page).to have_content("Hermoine")
  end

  it 'shows average age of students' do
    visit "/professors/#{@professor.id}"

    expect(page).to have_content("17")
  end
end