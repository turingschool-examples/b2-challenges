require 'rails_helper'

RSpec.describe 'mechanics index' do

  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Thomas Johnson", years_of_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Becky Johnson", years_of_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Carl Johnson", years_of_experience: 3)
  end

  it 'lists all mechanics and their attributes' do
    visit "/mechanics"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_of_experience)

    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_of_experience)

    expect(page).to have_content(@mechanic_3.name)
    expect(page).to have_content(@mechanic_3.years_of_experience)
  end


  it 'lists average_years_of_experience of all mechanics' do
    visit "/mechanics"

    expect(page).to have_content("Average Years of Experience: 4")
  end
end
