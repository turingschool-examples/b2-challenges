require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end
end
