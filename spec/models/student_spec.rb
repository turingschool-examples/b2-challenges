require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Relationship" do
    it { should have_many :rolls}
    it { should have_many(:professors).through(:rolls)}
  end
end
