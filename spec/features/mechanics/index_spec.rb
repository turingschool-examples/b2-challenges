require 'rails_helper'

RSpec.describe 'the mechanics index' do
  before(:each) do
    @bob = Mechanic.create(name: 'Bob', years_experience: 20)
    @amy = Mechanic.create(name: 'Amy', years_experience: 15)
    @lee = Mechanic.create(name: 'Lee', years_experience: 10)
  end

    it 'lists all the mechanics with their attributes' do
    visit "/mechanics"

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content("Name: #{@bob.name}")
    expect(page).to have_content("Years of Experience: #{@bob.years_experience}")
    expect(page).to have_content("Name: #{@amy.name}")
    expect(page).to have_content("Years of Experience: #{@amy.years_experience}")
    expect(page).to have_content("Name: #{@lee.name}")
    expect(page).to have_content("Years of Experience: #{@lee.years_experience}")

    expect(page).to have_content("Average Years Experience: 15")
  end
end
