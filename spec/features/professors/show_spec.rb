require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When i visit a professor show page' do
    it 'display professors with attributes' do
     professor1 = Professor.create!(name: 'Mr. Potter', age: 300, specilaty: 'Transfiguration')
     professor2 = Professor.create!(name: 'Mrs. Kat', age: 400, specilaty: 'Potions')

     visit '/professors'

     expect(page).to have_content(professor1.name)
     expect(page).to have_content(professor1.age)
     expect(page).to have_content(professor1.specilaty)
     expect(page).to have_content(professor2.name)
     expect(page).to have_content(professor2.age)
     expect(page).to have_content(professor2.specilaty)
   end

   it 'it list all names of students associated with this professor' do
   professor1 = Professor.create!(name: 'Mr. Potter', age: 300, specilaty: 'Transfiguration')
   professor2 = Professor.create!(name: 'Mrs. Kat', age: 400, specilaty: 'Potions')

    harry = Mission.create!(name: "Harry Potter", age: 10)
    ron = Mission.create!(name: "Ron Hogwarts", age: 12)

    ProfessorStudent.create!(professor_id: professor1.id, student_id: harry.id)
    ProfessorStudent.create!(professor_id: professor2.id, student_id: ron.id)

    visit '/professors/#{ron.id}'

    expect(Student.average_age).to eq(11)
 end
end


#start 8:00 pm
# As a visitor,
# When I visit a professor show page,
# Then I see that professor's name, age, and specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")

# And I see the names of all students associated with this professor

# User Story 2
#
# As a visitor,
# When I visit a professor show page,
# Then I see the average age of all students associated with this professor

# User Story 3
#
# As a visitor,
# When I visit the professor index,
# I see the name of each professor,
# And next to each professor I see a link to "Update"
# When I click this link,
# Then I am taken to a form where I can input a new name, age, and specialty
# When I click the submit button,
# Then I am taken back to the professors index where I see that professor has been updated
