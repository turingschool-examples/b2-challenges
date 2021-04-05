require 'rails_helper'

describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many :mechanics }
    it { should have_many :mechanic_rides }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :thrill_rating}
  end
end
