require 'rails_helper'

RSpec.describe 'Mechanic Features' do

  before(:each) do
    @mech1 = Mechanic.create!(name: Faker::Name.name, years_experience: 5)
    @mech2 = Mechanic.create!(name: Faker::Name.name, years_experience: 10)
    @mech3 = Mechanic.create!(name: Faker::Name.name, years_experience: 15)
    @mechs = [@mech1, @mech2, @mech3]
    @park = Park.create! name: Faker::Color.color_name, price: 10.00
    @ride1 = Ride.new(name: Faker::Game.title, thrill_rating: 1, open: true)
    @ride1.park = @park
    @ride1.save!
    @ride2 = Ride.new(name: Faker::Game.title, thrill_rating: 3, open: true)
    @ride2.park = @park
    @ride2.save!
    @ride3 = Ride.new(name: Faker::Game.title, thrill_rating: 2, open: false)
    @ride3.park = @park
    @ride3.save!
    @rides = [@ride1,@ride3,@ride3]
  end

  it 'should show index page' do
    visit '/mechanics'
    expect(page).to have_content 'All Mechanics'
    @mechs.each do |mech|
      expect(page).to have_content(mech.name)
      expect(page).to have_content(mech.years_experience)
    end
    expect(page).to have_content 'Average Years Experience: 10'
  end

  it 'should have show page' do
    @mech1.rides << [@ride1, @ride2, @ride3]
    visit "mechanics/#{@mech1.id}"
    expect(page).to have_content @mech1.name
    expect(page).to have_content @mech1.years_experience
    within '#rides' do
      expect(page).to have_content @ride1.name
      expect(page).to have_content @ride2.name
      expect(page).to have_no_content @ride3.name
      expect(@ride2.name).to appear_before(@ride1.name)
    end
  end

  it 'should add ride to mechanic' do
    visit "/mechanics/#{@mech1.id}"
    expect(page).to have_select('ride', :options => [@ride1.name,@ride2.name,@ride3.name])
    click_on 'commit'
    expect(page).to have_current_path "/mechanics/#{@mech1.id}"
    within '#rides' do
      expect(page).to have_content @ride1.name
    end
  end
end