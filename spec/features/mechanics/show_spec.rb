require 'rails_helper'

RSpec.describe 'Mechanics Show Page' do
  before :each do
    @steve = Mechanic.create!(name: 'Steve', years_experience: 4)
    @bill = Mechanic.create!(name: 'Bill', years_experience: 6)

    @ride1 = Ride.create!(name: 'The Beast', thrill_rating: 5, open: true)
    @ride2 = Ride.create!(name: 'Tornado', thrill_rating: 8, open: true)
    @ride3 = Ride.create!(name: 'The Tower of Terror', thrill_rating: 8, open: false)

    @ride4 = Ride.create!(name: 'Drop Zone', thrill_rating: 3, open: true)
    @ride5 = Ride.create!(name: 'Clown Town', thrill_rating: 7, open: true)
    @ride6 = Ride.create!(name: 'Wheel of fun', thrill_rating: 8, open: false)

    @ride7 = Ride.create!(name: 'Twister', thrill_rating: 9, open: true)

    @steve.rides.push(@ride1, @ride2, @ride3)
    @bill.rides.push(@ride4, @ride5, @ride6)

    visit mechanic_path(@steve)
  end

  it 'I see their name, years of experience, and the names of all rides they’re working on' do
    expect(page).to have_content(@steve.name)
    expect(page).to have_content(@steve.years_experience)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
  end

  it "I only see rides that are open" do
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)

    expect(page).to_not have_content(@ride3.name)
  end

  it "the rides are listed by thrill rating in descending order (most thrills first)" do
    expect(@ride2.name).to appear_before(@ride1.name)
  end

  it "I see a form to add a ride to their workload" do
    expect(page).to have_field('Ride Id:')
  end

  it "When I fill in that field with an id of an existing ride and hit submit. I then see that ride on added to the mechanic on the mechanic show page" do
    expect(current_path).to eq(mechanic_path(@steve))
    expect(page).to_not have_content(@ride7.name)

    fill_in 'Ride Id:', with: @ride7.id
    click_on 'Submit'

    expect(current_path).to eq(mechanic_path(@steve))
    expect(page).to have_content(@ride7.name)
  end
end
