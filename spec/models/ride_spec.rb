require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it {should have_many :ride_mechanics}
    it {should have_many(:mechanics).through(:ride_mechanics)}
    it {should belong_to :park}
  end
  describe "class methods" do
    describe "::open" do
      it 'only displays the rides that are open' do
        park = Park.create(name:'Cedar Point', price: 50.00)
        ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false, park_id: park.id)
        ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true, park_id: park.id)
        ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true, park_id: park.id)
      
        expect(Ride.open).to eq([ride2, ride3])
      end
    end
    describe "::sort_by_thrill" do
      it 'displays rides in order of thrill rating' do
        park = Park.create(name:'Cedar Point', price: 50.00)
        ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false, park_id: park.id)
        ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true, park_id: park.id)
        ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true, park_id: park.id)
        expect(Ride.sort_by_thrill).to eq([ride3,ride1,ride2])
      end
    end
    describe "::sort_alpha" do
      it 'displays rides in order alphabetically' do
        park = Park.create(name:'Cedar Point', price: 50.00)
        ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false, park_id: park.id)
        ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true, park_id: park.id)
        ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true, park_id: park.id)
        expect(Ride.sort_alpha).to eq([ride1,ride3,ride2])
      end
    end
    describe "::average_thrill" do
      it 'displays the average thrill rating' do
        park = Park.create(name:'Cedar Point', price: 50.00)
        ride1 = Ride.create(name:'death trap', thrill_rating: 7, open: false, park_id: park.id)
        ride2 = Ride.create(name:'slow, boring ride', thrill_rating: 1, open: true, park_id: park.id)
        ride3 = Ride.create(name:'flying death trap', thrill_rating: 10, open: true, park_id: park.id)
        expect(Ride.average_thrill).to eq(6.0)
      end
    end
  end
end