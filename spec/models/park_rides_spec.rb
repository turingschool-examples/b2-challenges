require 'rails_helper'

RSpec.describe ParkRide do
  describe 'relationships' do
    it {should belong_to(:ride)}
    it {should belong_to(:amusement_park)}
  end
end
