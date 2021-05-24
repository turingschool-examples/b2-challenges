require 'rails_helper'

RSpec.describe 'The show page for mechanics,' do

  before :all do
    @rich = Mechanic.create(name: 'Rich', years_experience: 12)

    @ride_1 = Ride.create(name: Faker::Name.name, thrill_rating: 5, open:true)
    @ride_2 = Ride.create(name: Faker::Name.name, thrill_rating: 8, open:false)
    @ride_3 = Ride.create(name: Faker::Name.name, thrill_rating: 10, open:true)
    @ride_4 = Ride.create(name: Faker::Name.name, thrill_rating: 3, open:true)
    @ride_5 = Ride.create(name: Faker::Name.name, thrill_rating: 11, open:true)

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
    expect(page).to have_selector('h2', text: "Mechanic: #{@rich.name}")
  end

  it 'shows years of experience' do
    expect(page).to have_selector('h3', text: "Years of Experience: #{@rich.years_experience}")
  end

  describe 'add ride to workload,' do
    it 'has a header' do
      within 'form' do
        expect(page).to have_selector('h3', text: 'Add a ride to workload:')
      end
    end

    it 'has a textfield to enter a ride id' do
      within 'form' do
        expect(page).to have_field('add_ride[ride_id]')
      end
    end

    it 'navigates back to show page and shows the added ride to workload' do
      within 'form' do
        fill_in 'add_ride[ride_id]', with: @ride_5.id
        click_button 'Add Ride to Workload'
      end

      current_path.should eq "/mechanics/#{@rich.id}"

      within '#rides_list' do
        expect(page).to have_selector("#ride_#{@ride_5.id}", text: @ride_5.name)
      end
    end
  end

  describe 'current rides they are working on,' do
    it 'has a header' do
      within '#rides_list' do
        expect(page).to have_selector('caption', text: "Current rides they're working on:")
      end
    end

    it 'shows rides this mechanic is working on' do
      @rich.rides_working_on.each do |ride|
        within "#ride_#{ride.id}" do
          expect(page).to have_content(ride.name)
          expect(page).to have_content(ride.thrill_rating)
        end
      end
    end
  end
end
