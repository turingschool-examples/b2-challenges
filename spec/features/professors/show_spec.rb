require 'rails_helper'

describe 'When I visit a professor show page' do
  before :each do
    @professor1 = Professor.create(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
  end

  it 'I see that professors name, age, and specialty' do
    visit "/professors/#{@professor1.id}"

    within '#professor-info' do
      expect(page).to have_content("Minerva McGonagall")
      expect(page).to have_content("204")
      expect(page).to have_content("Transfiguration")
    end
  end
end
