require 'rails_helper'

RSpec.describe 'mechanic index' do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Sam", years_experience: 3)
    @mechanic_2 = Mechanic.create!(name: "James", years_experience: 9)

    visit '/mechanics'
  end

  it 'lists mechanics' do
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_2.years_experience)
    expect(page).to have_content("Average Years Experience")
  end
end