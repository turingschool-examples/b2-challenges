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
  describe 'when i visit the professor index' do
    it 'i see the name of each professor' do
      visit "/professors"
save_and_open_page
      expect(page).to have_content(@professor_1.name)
      expect(page).to have_content(@professor_2.name)
    end
  end
end

# And next to each professor I see a link to "Update"
# When I click this link,
# Then I am taken to a form where I can input a new name, age, and
#  specialty When I click the submit button,
# Then I am taken back to the professors index where I see that professor
#  has been updated
