require "rails_helper"

RSpec.describe 'the mechanic show' do
  it 'lists all the mechanics attributes' do
    mechanic_1 = Mechanic.create!(name: 'Tina', years_experience: 12)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
  end
end
