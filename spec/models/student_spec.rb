RSpec.describe ApplicationPet, type: :model do
  describe "relationships" do
    it { should have_many(:professors).through(:student_professors) }
  end
end
