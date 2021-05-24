require 'rails_helper'

RSpec.describe 'the mechanic index' do
  it 'has a header saying All Mechanics' do
    mechanic_1 = Mechanic.create!(name: 'Fix it Felix', years_experience: 25)

    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
  end
end