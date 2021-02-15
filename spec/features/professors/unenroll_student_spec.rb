require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @professor1 = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @student1 = @professor1.students.create!(name: 'Angel', age: 61)
  end

  describe 'When I visit the professor show page' do
    it 'I see a button "Unenroll" next to each student' do
      visit "/professors/#{@professor1.id}"
      expect(page).to have_button('Unenroll')
    end
  end
end

# When I visit the professor show page
# Next to each students name I see a button "Unenroll"
# When I click this button
# Then I am taken back to the professor's show page
# And I no longer see the student listed

# (Note: You should not delete the student record entirely)
