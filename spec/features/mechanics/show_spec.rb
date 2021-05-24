require "rails_helper"

RSpec.describe 'the mechanics show page', type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Jo Olson', experience: 4)
    @mechanic_3 = Mechanic.create!(name: 'Letty Ortiz', experience: 9)
  end

  it 'shows a mechanics attributes the names of all rides they’re working on' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)

    visit "/mechanics/#{@mechanic_3.id}"
    save_and_open_page
    expect(page).to have_content(@mechanic_3.name)
    expect(page).to have_content(@mechanic_3.experience)
  end
end

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they’re working on
# And I only see rides that are open
# And the rides are listed by thrill rating in descending order (most thrills first)
