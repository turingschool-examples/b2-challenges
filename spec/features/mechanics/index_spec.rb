require 'rails_helper'

RSpec.describe 'mechanics index page' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Lois Iddrisu', years_of_experience: 6)
    @mechanic_3 = Mechanic.create!(name: 'Bob Stewart', years_of_experience: 7)
  end

  it 'has a header saying All Mechanics' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
  end

  it 'lists all mechanics names and years of experience' do
    visit '/mechanics'

    expect(page).to have_content("#{@mechanic_1.name}")
    expect(page).to have_content("#{@mechanic_2.name}")
    expect(page).to have_content("#{@mechanic_3.name}")

    expect(page).to have_content("#{@mechanic_1.years_of_experience}")
    expect(page).to have_content("#{@mechanic_2.years_of_experience}")
    expect(page).to have_content("#{@mechanic_3.years_of_experience}")
  end

  it 'shows the average years of experience across all mechanics' do
    visit '/mechanics'

    expected_average_sum = @mechanic_1.years_of_experience + @mechanic_2.years_of_experience + @mechanic_3.years_of_experience
    expected_average = expected_average_sum / 3
    expect(page).to have_content("#{expected_average}")
  end
end
