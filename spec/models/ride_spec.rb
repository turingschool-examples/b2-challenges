require 'rails_helper'

describe Ride, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :thrill_rating}
    it {should validate_presence_of :open}
  end
end
