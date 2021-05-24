require 'rails_helper'

RSpec.describe 'the parks show page' do
  before (:each) do
    @park_1 = Park.create!(name: 'Elitches', admission_price: 20)

    @ride_1 = @park_1.rides.create(name: 'Scrambler', thrill_rating: 8, open: true)
    @ride_2 = @park_1.rides.create(name: 'Tea Cups', thrill_rating: 2, open: true)
    @ride_3 = @park_1.rides.create(name: 'Log Ride', thrill_rating: 4, open: false)
    @ride_4 = @park_1.rides.create(name: 'Tower of Doom', thrill_rating: 10, open: true)
  end

  describe 'page appearance' do
    it 'lists the parks with their attributes' do
      visit "/parks/#{@park_1.id}"

      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.admission_price)
    end
    it 'lists the rides at the park in alphabetical order' do
      visit "/parks/#{@park_1.id}"

      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_3.name)
      expect(page).to have_content(@ride_4.name)
      expect(@ride_3.name).to appear_before(@ride_1.name)
    end
    it 'list the average thrill rating of all the rides at the park' do
      visit "/parks/#{@park_1.id}"

      expect(page).to have_content('Average Ride Thrill Rating')
      expect(page).to have_content('6.0')
    end
  end
end