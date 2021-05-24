require 'rails_helper'

RSpec.describe 'Mechanic Features' do

  before(:each) do
    @mech1 = Mechanic.create!(name: Faker::Name.name, years_experience: 5)
    @mech2 = Mechanic.create!(name: Faker::Name.name, years_experience: 10)
    @mech3 = Mechanic.create!(name: Faker::Name.name, years_experience: 15)
    @mechs = [@mech1, @mech2, @mech3]
  end

  it 'should show index page' do
    visit '/mechanics'
    expect(page).to have_content 'All Mechanics'
    @mechs.each do |mech|
      expect(page).to have_content(mech.name)
      expect(page).to have_content(mech.years_experience)
    end
    expect(page).to have_content 'Average Years Experience: 10'
  end

  it 'should have show page' do

  end
end