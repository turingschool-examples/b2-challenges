require 'rails_helper'

describe Ride, type: :model do

  describe 'Relationships' do
    it { should have_many :mechanic_rides}
    it { should have_many :mechanics}
  end
end
