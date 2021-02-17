require 'rails_helper'
describe Student, type: :model do
  describe "Relationship" do
    it { should have_many :professor_students}
    it { should have_many(:professors).through(:professor_students) }
  end
end
