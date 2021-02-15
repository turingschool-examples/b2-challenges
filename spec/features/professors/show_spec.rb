require 'rails_helper'

RSpec.describe 'Professors show page' do
  before :each do
    @mcgonagall = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @bobby = @mcgonagall.students.create!(name: 'Bobby Hill', age: 15)
    @wesley = @mcgonagall.students.create!(name: 'Wesley Crusher', age: 21)
  end

  describe 'as a visitor' do
    it 'shows professor info' do
      visit "/professors/#{@mcgonagall.id}"

      within('#prof-info') do
        expect(page).to have_content('Minerva McGonagall')
        expect(page).to have_content('204')
        expect(page).to have_content('Transfiguration')
      end
    end

    it 'shows professor student names' do
      visit "/professors/#{@mcgonagall.id}"

      within('#prof-students') do
        expect(page).to have_content('Bobby Hill')
        expect(page).to have_content('Wesley Crusher')
      end
    end

    describe 'shows average student age' do
      it 'can be a whole number' do
        visit "/professors/#{@mcgonagall.id}"

        within('#avg-student-age') do
          expect(page).to have_content('18')
        end
      end

      it 'can be a decimal' do
        @wesley.update(age: @wesley.age += 1) # Happy birthday, Wesley

        visit "/professors/#{@mcgonagall.id}"

        within('#avg-student-age') do
          expect(page).to have_content('18.5')
        end
      end
    end
  end
end
