require 'rails_helper'

RSpec.describe 'Park Features' do

  before(:each) do
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
  it 'should have show page' do
    visit "/parks/#{@park.id}"
    expect(page).to have_content @park.name
    expect(page).to have_content "Admission: $10.00"
    @rides.each do |ride|
      expect(page).to have_content ride.name
    end
    expect(page).to have_content "Average Thrill Rating: 2"
  end
end