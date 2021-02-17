require 'rails_helper'

RSpec.describe 'as a visitor' do
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
