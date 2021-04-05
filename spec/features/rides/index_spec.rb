require 'rails_helper'

RSpec.describe 'When I visit the rides index page' do
  it 'I see a header that displays ALL RIDES IN REPAIR' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
    hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
    topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
    bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)

    visit "/rides"
    expect(page).to have_content("All Rides in Repair")
    expect(page).to have_content("Whirly Doo")
    expect(page).to have_content("Hold On To Yer Butts")
    expect(page).to have_content("Topsy Turvey")
    expect(page).to have_content("Was A Bad Idea")
  end
end
