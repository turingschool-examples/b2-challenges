#spec/models/amusement_park_spec
require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
    it {should have_many :mechanics}
  end
end