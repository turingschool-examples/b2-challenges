require 'rails_helper'

RSpec.describe 'as a visitor' do
  before :each do
    @professor_1 = Professor.create!(name: "Gandalf", age: 72, specialty: "Potions")
    @professor_2 = Professor.create!(name: "Dumbledore", age: 71, specialty: "Spells")
    @student_1 = @professor_1.students.create!(name: "Timmy", age: 15)
    @student_2 = @professor_1.students.create!(name: "Sara", age: 14)
    @student_3 = @professor_1.students.create!(name: "Jenny", age: 13)
    @student_4 = @professor_2.students.create!(name: "James", age: 12)
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
save_and_open_page
      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@student_2.name)
      expect(page).to have_content(@student_3.name)
      expect(page).not_to have_content(@student_4.name)
      # require "pry"; binding.pry
    end
    # it 'i also see the average age of all students for this professor' do
    #   visit "/professors/#{@professor_1.id}"
    #
    #   expect(page).to have_content(14)
    # end
  end
end
# As a visitor,
# When I visit a professor show page,
# Then I see the average age of all students associated
# with this professor
