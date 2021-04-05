require "rails_helper"

describe MechanicsAndRide do
  describe "relationships" do
    it {should belong_to :rides}
    it {should belong_to :mechanics }
  end
end
