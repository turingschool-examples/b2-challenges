require 'rails_helper'

RSpec.describe 'Amusement Park Show Page' do
  before :each do
    @park_1 = AmusementPark.create!(name: 'Super Fun Park', admission_price: 12)
    @park_2 = AmusementPark.create!(name: 'Not So Super Fun Park', admission_price: 10)

    visit "/amusement_parks/#{@park_1.id}"
  end

  it 'has amusement park name and admission price' do

    expect(page).to have_content('Super Fun Park')
    expect(page).to have_content(12)
  end
end
