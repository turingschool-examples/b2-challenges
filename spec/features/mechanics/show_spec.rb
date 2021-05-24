require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
    before :each do
    @mechanic1 = Mechanic.create!( name:"Joe Meek",
                                   years_experience: 10
                                  )
    @mechanic2 = Mechanic.create!( name:"Sara Fix",
                                     years_experience: 6
                                  )
  end
  it "displays a mechanics information " do
    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content("Years Experience: 10")
  end
end
