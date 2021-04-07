require "rails_helper"

RSpec.describe 'mechanic index page' do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Josie', years_of_experience: 3)
    @mechanic2= Mechanic.create!(name: 'Emmy', years_of_experience: 5)
  end

  it 'shows mechanic attributes' do
    visit '/mechanics'
    within "#mechanic-#{@mechanic_1.id}" do
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic1.years_of_experience)
    end

    within "#mechanic-#{@mechanic_2.id}" do
      expect(page).to have_content(@mechanic2.name)
      expect(page).to have_content(@mechanic2.years_of_experience)
    end
  end

  it 'shows the average years of experience' do
    visit '/mechanics'
    expect(page).to have_content("Average years experience: #{Mechanic.average_years_experience}")
  end
end
