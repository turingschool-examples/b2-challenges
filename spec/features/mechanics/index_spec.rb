require "rails_helper"

RSpec.describe 'the mechanics index', type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Jo Olson', experience: 4)
    @mechanic_3 = Mechanic.create!(name: 'Letty Ortiz', experience: 9)
  end

  it 'has an All Mechanics geader' do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
  end

  it 'lists all the mechanics with their attributes' do
    visit "/mechanics"
save_and_open_page
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.experience)
  end
end

#
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
