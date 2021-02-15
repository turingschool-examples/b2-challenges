require 'rails_helper'

RSpec.describe 'the professor index page' do
  it 'displays prof attributes' do
    prof = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')

    visit '/professors'

    expect(page).to have_link('Minerva McGonagall')
    expect(page).to have_content('Age: 204')
    expect(page).to have_content('Specialty: Transfiguration')
  end
end
