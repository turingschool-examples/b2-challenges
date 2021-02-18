require 'rails_helper'

describe 'When I visit a professor show page' do
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

  it 'I see that professors name, age, and specialty' do
    visit "/professors/#{@professor1.id}"

    within '#professor-info' do
      expect(page).to have_content("Minerva McGonagall")
      expect(page).to have_content("204")
      expect(page).to have_content("Transfiguration")
    end
  end

  it 'and I see all the students associated with this professor' do
    visit "/professors/#{@professor1.id}"

    within '#students-info' do
      expect(page).to have_content("Harry Potter")
      expect(page).to have_content("17")
      expect(page).to have_content("Ronald Weasley")
      expect(page).not_to have_content("Hermione Granger")
      expect(page).not_to have_content("18")
      expect(page).not_to have_content("Neville Longbottom")
    end
  end

  it 'and I see the average age of all the students for this professor' do
    visit "/professors/#{@professor1.id}"
    within '#students-info' do
      expect(page).to have_content("Average Age of Students: 17.0")
    end

    visit "/professors/#{@professor2.id}"
    within '#students-info' do
      expect(page).to have_content("Average Age of Students: 17.33")
    end

    visit "/professors/#{@professor3.id}"
    within '#students-info' do
      expect(page).to have_content("Average Age of Students: 17.0")
    end
  end
end
