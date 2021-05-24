require 'rails_helper'


# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

describe 'Mechanics Index' do
  it 'has a list of all mechanics names and experience as well as the average years experience' do
    jim = Mechanic.create(name:'Jim Bob', years_experience: 2)
    sue = Mechanic.create(name:'Sue', years_experience: 3)
    tim = Mechanic.create(name:'Tim Bob', years_experience: 5)
    tony = Mechanic.create(name:'Tony Saprano', years_experience: 6)

    visit '/mechanics'
    expect(page).to have_content('Jim Bob')
    expect(page).to have_content('Sue')
    expect(page).to have_content('Tim Bob')
    expect(page).to have_content('Tony Saprano')
    expect(page).to have_content(2)
    expect(page).to have_content(3)
    expect(page).to have_content(5)
    expect(page).to have_content(6)
    expect(page).to have_content(4)

  end


end