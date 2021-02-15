require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @professor = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @student1 = @professor.students.create!(name: 'Angel', age: 61)
    @student2 = @professor.students.create!(name: 'Chris', age: 86)
  end

  describe 'When I visit a professor show page' do
    it 'I see that professors name, age, and specialty' do
      visit "/professors/#{@professor.id}"

      within("#professor-#{@professor.id}") do
        expect(page).to have_content(@professor.name)
        expect(page).to have_content(@professor.age)
        expect(page).to have_content(@professor.specialty)
      end
    end

    it 'I see the names of all students associated with this professor' do
      visit "/professors/#{@professor.id}"

      within("#professor-#{@professor.id}") do
        expect(page).to have_content(@student1.name)
        expect(page).to have_content(@student2.name)
      end
    end
  end
end
