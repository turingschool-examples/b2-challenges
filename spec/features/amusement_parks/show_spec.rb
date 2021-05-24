require 'rails_helper'

RSpec.describe 'amusement park info page' do

  before :all do
    @park = AmusementPark.create!(name: "Elitch Gardens", price: 70.00)
    @ride1 = Ride.create!(name: "Hurly Whirley", open: false, thrill_rating: 10)
    @ride2 = Ride.create!(name: "Top Rock", open: true, thrill_rating: 3)
    @ride3 = Ride.create!(name: "Squiggler", open: true, thrill_rating: 5)
  end

end
