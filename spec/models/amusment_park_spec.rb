require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relations' do
    it {should have_many(:park_rides)}
    it {should have_many(:rides).through(:park_rides)}
  end

  describe 'validatons' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:admission_price)}
  end
end
