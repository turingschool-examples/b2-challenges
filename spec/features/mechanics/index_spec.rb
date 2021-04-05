require 'rails_helper'

RSpec.describe 'courses index page', type: :feature do
  before :each do
    @mechanic1 = Mechanic.create(name: "Alan Brown", years_of_experience: 14)
    @mechanic2 = Mechanic.create(name: "Ziggy Lowe", years_of_experience: 5)
    @mechanic2 = Mechanic.create(name: "Charlie Tei", years_of_experience: 18)

    visit '/mechanics'
  end

  it 'can see a header saying “All Mechanics”' do
    expect(page).to have_content("All Mechanics")
  end
end
