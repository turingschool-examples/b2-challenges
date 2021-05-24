require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many(:ride_mechanics).dependent(:destroy)}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'class methods' do
    describe '::avg_years_experience' do
      it 'returns the average years experience of all mechanics' do
        jim = Mechanic.create!(name: "Jim", years_experience: 17)
        xena = Mechanic.create!(name: "Xena", years_experience: 23)

        expect(Mechanic.avg_years_experience).to eq 20
      end
    end
  end

  describe 'instance methods' do
    describe '::open_rides_by_thrill_rating' do
      it 'returns the rides ordered by thrill rating desc' do
        jim = Mechanic.create!(name: "Jim", years_experience: 17)
        hershey = AmusementPark.create!(name: 'Hershey Park', price: 50.0)

        tea_cups = jim.rides.create!(name: 'The Tea Cups', thrill_rating: 2, open: true, amusement_park: hershey)
        tot = jim.rides.create!(name: 'Tower of Terror', thrill_rating: 8, open: true, amusement_park: hershey)
        swings = jim.rides.create!(name: 'The Swings', thrill_rating: 5, open: true, amusement_park: hershey)
        strawberry = jim.rides.create!(name: 'Strawberry Fields', thrill_rating: 3, open: false, amusement_park: hershey)

        expect(jim.open_rides_by_thrill_rating).to eq [tot, swings, tea_cups]
      end
    end
  end
end
