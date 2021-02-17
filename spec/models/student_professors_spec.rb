require 'rails_helper'

RSpec.describe StudentProfessors, type: :model do
  describe "relationships" do
    it {should belong_to :student}
    it {should belong_to :professor}
  end
end
