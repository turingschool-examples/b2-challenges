require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "relationships" do
    it { should have_many(:professors).through(:student_professors) }
  end
end
