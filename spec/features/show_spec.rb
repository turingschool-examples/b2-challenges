require 'rails_helper'

RSpec.describe 'The show page for mechanics,' do

  before :all do
    @rich = Mechanic.create(name: 'Rich', years_experience: 12)

    @ride_1 = Ride.create(name: Faker::Name.name, thrill_rating: 5, open:true)
    @ride_2 = Ride.create(name: Faker::Name.name, thrill_rating: 8, open:false)
    @ride_3 = Ride.create(name: Faker::Name.name, thrill_rating: 10, open:true)
    @ride_4 = Ride.create(name: Faker::Name.name, thrill_rating: 3, open:true)

    @rich.rides << @ride_1 << @ride_2 << @ride_3 << @ride_4
  end

  before :each do
    visit "/mechanics/#{@rich.id}"
  end

  after :all do
    Mechanic.destroy_all
    Ride.destroy_all
  end

  it 'has a header with the name of the mechanic' do
    expect(page).to have_selector('#mechanic_name', text: "Mechanic: #{@rich.name}")
  end

  it 'shows years of experience' do
    expect(page).to have_selector('#years_experience', text: "Years of Experience: #{@rich.years_experience}")
  end

  describe 'current rides they are working on,' do
    it 'has a header' do
      within '#rides_list' do
        expect(page).to have_selector('h3', text: "Current rides they're working on:")
      end
    end

    it 'shows rides this mechanic is working on' do
      @rich.rides_working_on.each do |ride|
        within "#ride_#{ride.id}" do
          expect(page).to have_content(ride.name)
        end
      end
    end
  end
end
