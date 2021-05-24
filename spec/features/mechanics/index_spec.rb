require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
    before :each do
    @mechanic1 = Mechanic.create!( name:"Joe Meek",
                                   years_experience: 10,
                                  )
    @mechanic2 = Mechanic.create!( name:"Sara Fix",
                                     years_experience: 6,
                                  )
  end
  it "can see the mechanics header and a list of all the mechanics and information" do
    visit "/mechanics"

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic2.name)
  end
end
