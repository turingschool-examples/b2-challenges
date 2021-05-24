require 'rails_helper'

describe 'mechanics show page' do
  before :each do
    @tim = Mechanic.create!(name:'Tim', experience: 12)
    visit "/mechanics/#{@tim.id}"
  end
  it 'displays a mechanics name and age' do
    expect(page).to have_content('Mechanic Name: Tim')
    expect(page).to have_content('Mechanic Experience: 12 years')
  end
end