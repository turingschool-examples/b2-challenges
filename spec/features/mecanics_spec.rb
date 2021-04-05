require 'rails_helper'

RSpec.describe "when i visit mechanics" do
  it "i see all mechanics listed" do

    mechanic_1 = Mechanic.create!(name: "andrew", experiance: 1)
    mechanic_2 = Mechanic.create!(name: "steven", experiance: 30)
    mechanic_3 = Mechanic.create!(name: "roberta", experiance: 5)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.experiance)

    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.experiance)

    expect(page).to have_content(mechanic_3.name)
    expect(page).to have_content(mechanic_3.experiance)
  end


end
