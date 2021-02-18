require 'rails_helper'

RSpec.describe Roll, type: :model do
  describe "Relationship" do
    it { should belong_to :professor}
    it { should belong_to :student}
  end
end
