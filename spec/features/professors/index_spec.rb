require 'rails_helper'

RSpec.describe 'Professor index page' do
  before :each do
    @mcgonagall = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
    @lupin = Professor.create!(name: "Remus Lupin", age: 45, specialty: "Defence Against the Dark Arts")
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
  end

  it "displays a link to each professors show page" do

    visit "/professors"

    expect(page).to have_link(@mcgonagall.name)
    expect(page).to have_link(@lupin.name)
    expect(page).to have_link(@snape.name)
  end
end
