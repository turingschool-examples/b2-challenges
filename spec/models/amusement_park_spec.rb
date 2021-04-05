require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:amusement_park_rides) }
    it { should have_many(:rides) }
  end
end
