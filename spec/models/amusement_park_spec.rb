require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'instance methods' do
    describe '::display_price' do
      it 'displays the price as a string with dollar sign and 2 decimals' do
        hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)

        expect(hershey.display_price).to eq '$50.00'
      end
    end

    describe '::rides_by_name' do
      it 'displays the rides in order by name' do
        hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)
        tea_cups = hershey.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true)
        tot = hershey.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true)
        swings = hershey.rides.create!(name: 'The Swings', thrill_rating: 5, open: true)
        strawberry = hershey.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false)

        expect(hershey.rides_by_name).to eq [strawberry, swings, tea_cups, tot]
      end
    end
  end
end
