require 'rails_helper'

RSpec.describe 'as a visitor' do
  before :each do
    @professor_1 = Professor.create!(name: "Gandalf", age: 72, specialty: "Potions")
    @student_1 = @Professor_1.students.create!(name: "Timmy", age: 15)
    @student_2 = @Professor_1.students.create!(name: "Sara", age: 14)
    @student_3 = @Professor_1.students.create!(name: "Jenny", age: 13)
  end
  describe 'when i visit the professor show page' do
    it 'i see that profesors name, age, and specialty' do
      visit "/professors/#{@professor_1.id}"

      expect(page).to have_content(@professor_1.name)
      expect(page).to have_content(@professor_1.age)
      expect(page).to have_content(@professor_1.specialty)
    end
    it 'i also see all the professors associated student names' do
      visit "/professors/#{@professor_1.id}"

      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@student_2.name)
      expect(page).to have_content(@student_3.name)
    end
  end
end

# As a visitor,
# When I visit a professor show page,
# Then I see that professor's name, age, and specialty
# (e.g. "Name: Minerva McGonagall, Age: 204,
#   Specialty: Transfiguration")
# And I see the names of all students associated with
# this professor
