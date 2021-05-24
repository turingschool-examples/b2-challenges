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
    
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.experience)
  end

  it 'displays the average years of experience across all mechanics' do
    visit "/mechanics

    expect(page).to have_content(8)
  end
end
