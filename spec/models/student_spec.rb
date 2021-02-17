require 'rails_helper'
describe Student, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
  end

  describe "Relationship" do
    it { should have_many :professor_students}
    it { should have_many(:professors).through(:professor_students) }
  end
end
