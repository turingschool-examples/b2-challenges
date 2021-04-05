require 'rails_helper'

RSpec.describe AmusementParkRide, type: :model do
  describe 'relationships' do
    it { should belong_to(:ride) }
    it { should belong_to(:amusement_park) }
  end
end
