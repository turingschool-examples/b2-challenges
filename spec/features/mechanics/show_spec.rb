require 'rails_helper'

RSpec.describe 'When I visit the mechanic show page' do
  it 'S2: I see their attributes and names of rides they are currently working on' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
    hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
    topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
    bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)

    visit "/mechanics/#{mechanic_1.id}"
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content("Hold On To Yer Butts")
    expect(page).to have_content("Topsy Turvey")
    expect(page).to have_content("Was A Bad Idea")
    expect(page).to have_content("Whirly Doo")
  end

  it 'S2: I only see rides that are open' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
    hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
    topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
    bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)

    visit "/mechanics/#{mechanic_1.id}"
    expect(page).to have_content("Hold On To Yer Butts")
    expect(page).to have_content("Topsy Turvey")
    expect(page).to have_content("Was A Bad Idea")
    expect(page).to_not have_content("Whirly Doo")
  end

  it 'S2: I see rides in descending order of thrill rating' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
    hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
    topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
    bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)

    visit "/mechanics/#{mechanic_1.id}"
    expect(page).to have_content("Was A Bad Idea")
    expect(page).to have_content("Hold On To Yer Butts")
    expect(page).to have_content("Topsy Turvey")
    #Find assertion for content order
  end

  it 'S3: I see a form to add a ride to mechanic workload' do
    mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
    whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
    hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
    topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
    bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)

    visit "/mechanics/#{mechanic_1.id}"
    click_link 'Add Ride for Repair'
    expect(current_path).to eq ("/mechanics/#{mechanic_1.id}/rides/new")
  end
end
