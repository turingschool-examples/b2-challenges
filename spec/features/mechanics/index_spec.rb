require 'rails_helper'

RSpec.describe 'Mechanics Index Page' do
  before :each do
    visit '/mechanics'
  end

  it 'has a header saying all mechanics' do

    expect(page).to have_content('All Mechanics')
  end

  it 'shows all mechanics names and years of experience' do

    expect(page).to have_content()
    expect(page).to have_content()
    expect(page).to have_content()
  end

  it 'shows an average years of experience' do

    expect(page).to have_content()
  end
end
