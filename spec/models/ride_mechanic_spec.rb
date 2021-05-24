require 'rails_helper'

RSpec.describe RideMechanic do
  describe 'relationships' do
    it { should belong_to(:mechanic) }
    it { should belong_to(:ride) }
    it { should belong_to(:amusement_park) }
  end
end
