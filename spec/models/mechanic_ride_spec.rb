require 'rails_helper'

describe MechanicRide, type: :model do

  describe 'Relationships' do
    it { should belong_to :mechanic}
    it { should belong_to :ride}
  end
end
