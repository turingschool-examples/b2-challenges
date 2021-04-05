require 'rails_helper'

RSpec.describe 'User Story 1', type: :feature do
  it 'can list all mechanics, their years of experience and the average total years' do
    steve = Mechanic.create!(name: "Steve Brown", years_of_experience: 27)
    doug = Mechanic.create!(name: "Doug Wood", years_of_experience: 17)
    greg = Mechanic.create!(name: "Greg Marshall", years_of_experience: 10)

    visit '/mechanics'

    expect(page).to have_content("Steve Brown")
    expect(page).to have_content("27")
    expect(page).to have_content("Doug Wood")
    expect(page).to have_content("17")
    expect(page).to have_content("Greg Marshall")
    expect(page).to have_content("10")
    expect(page).to have_content("18")
  end
end


# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics