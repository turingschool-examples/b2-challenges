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
                                           thrill_rating: 6,
                                           open: true
                                          )
    @ride3     = @mechanic1.rides.create!( name:"Nitro",
                                           thrill_rating: 7,
                                           open: true
                                          )
  end
  it "displays a mechanics information and the rides worked on " do
    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content("Years Experience: 10")
    expect(page).to have_content(@ride2.name)
    expect(page).to_not have_content(@ride1.name)
    #expect(@ride3.name).to appear_before(@ride2.name)
  end

  it "has form to add ride" do
    visit "/mechanics/#{@mechanic1.id}"

    fill_in 'name:', with: 'Scream Machine'
    click_on 'Submit'

    expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      expect(page).to have_content('Scream Machine')
      expect(page).to have_button("Submit")
  end
end
