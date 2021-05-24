require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
    before :each do
    @mechanic1 = Mechanic.create!( name:"Joe Meek",
                                   years_experience: 10
                                  )
    @ride1     = @mechanic1.rides.create!( name:"Thunder Dome",
                                           thrill_rating: 5,
                                           open: false
                                          )
    @ride2     = @mechanic1.rides.create!( name:"Wet Willy",
                                           thrill_rating: 3,
                                           open: true
                                          )
  end
  it "displays a mechanics information and the rides worked on " do
    visit "/mechanics/#{@mechanic1.id}"
    save_and_open_page
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content("Years Experience: 10")
    expect(page).to have_content("Years Experience: 10")

  end
end
