require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do
  before :each do
    @mech_1 = Mechanic.create!(name: 'Roald', years_experience: 25)
    @mech_1 = Mechanic.create!(name: 'Larry', years_experience: 10)
    @mech_1 = Mechanic.create!(name: 'Samantha', years_experience: 30)

    visit '/mechanics'
  end

  it 'has a header saying all mechanics' do

    expect(page).to have_content('All Mechanics')
  end

  it 'shows all mechanics names and years of experience' do

    within "#mechanic-#{@mech_1}"
      expect(page).to have_content('Roald')
      expect(page).to have_content(25)

    within "#mechanic-#{@mech_2}"
      expect(page).to have_content('Roald')
      expect(page).to have_content(25)

    within "#mechanic-#{@mech_3}"
      expect(page).to have_content('Roald')
      expect(page).to have_content(25)
  end

  xit 'shows an average years of experience' do

    expect(page).to have_content()
  end
end
