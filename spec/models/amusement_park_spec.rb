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
  end
end
