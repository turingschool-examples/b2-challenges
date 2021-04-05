require "rails_helper"

RSpec.describe "mechanics index page", type: :feature do
  before :each do
    @anna = Mechanic.create!(name: 'Anna Allen', years_experience: 9)
    @bradley = Mechanic.create!(name: 'Bradley Driver', years_experience: 10)
    @chelsey = Mechanic.create!(name: 'Chelsey Vise', years_experience: 11)
    visit '/mechanics'
  end

  it "displays all mechanics and their attributes" do
    expect(page).to have_content(@anna.name)
    expect(page).to have_content(@anna.years_experience)
    expect(page).to have_content(@bradley.name)
    expect(page).to have_content(@bradley.years_experience)
    expect(page).to have_content(@chelsey.name)
    expect(page).to have_content(@chelsey.years_experience)
  end

  it "displays the average years of experience across all mechanics" do
    expect(page).to have_content("Average Years of Experience: 10")
  end
end
