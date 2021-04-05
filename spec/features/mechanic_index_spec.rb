require 'rails_helper'

describe "mechanics index page", type: :feature do
  before :each do
    @steve = Mechanic.create!(name: 'Steve', years_experience: 4)
    bill = Mechanic.create!(name: 'Bill', years_experience: 6)
  end

  it "shows all mechanics" do
    visit '/mechanics'

    expect(page).to have_content(@steve.name)
    expect(page).to have_content(@steve.years_experience)
  end
end
