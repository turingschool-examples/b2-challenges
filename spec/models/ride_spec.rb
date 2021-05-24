require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it {should have_and_belong_to_many(:mechanic)}
  end
end