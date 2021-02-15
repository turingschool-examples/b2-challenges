require 'rails_helper'

RSpec.describe 'the professor show page' do
  before :each do
    @mine = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @dumb = Professor.create!(name: 'Albus Dumbledore', age: 345, specialty: 'Hubris')
    @nevi = Student.create!(name: 'Neville Longbottom', age: 17)
    @luna = Student.create!(name: 'Luna Lovegood', age: 17)
    @cho  = Student.create!(name: 'Cho Chang', age: 18)

    @mine.students << @nevi
    @mine.students << @luna
    @mine.students << @cho

    @dumb.students << @nevi
  end
  it 'displays prof attributes' do
    visit "/professors/#{@mine.id}"

    expect(page).to have_content('Minerva McGonagall')
    expect(page).to have_content('Age: 204')
    expect(page).to have_content('Specialty: Transfiguration')

    within('.students') do
      expect(page).to have_content('Neville Longbottom')
      expect(page).to have_content('Luna Lovegood')
      expect(page).to have_content('Cho Chang')
    end

  end
end
