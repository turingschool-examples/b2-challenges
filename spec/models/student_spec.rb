require 'rails_helper'

describe Student, type: :model do
  describe 'relationships' do
    it { should have_many :professor_students }
    it { should have_many(:professors).through(:professor_students) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end
end
