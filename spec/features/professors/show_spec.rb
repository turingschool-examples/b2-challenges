  require 'rails_helper'

  RSpec.describe 'When I visit a Professors show page' do
    it 'displays the professors name, age, and specialty' do
      visit "/professors/#{minerva.id}"

      minerva = Professor.create!(
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
      )

      expect(page).to have_content("Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
    end

    it 'displays all the Student names associated with this professor' do
      visit "/professors/#{minerva.id}"

      @minerva = Professor.create!(
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
      )
      @harry = Student.create!(
        name: 'Harry Potter',
        age: '14',
        house: 'Hogwarts'
      )
      @cass = Student.create!(
        name: 'Casseopia Black',
        age: '14',
        house: 'Slytherin'
      )

      ProfessorStudent.create!(professor: @minerva, student: @cass)
      ProfessorStudent.create!(professor: @minerva, student: @harry)

      expect(page).to have_content('Harry Potter')
      expect(page).to have_content('Casseopia Black')
    end
  end
