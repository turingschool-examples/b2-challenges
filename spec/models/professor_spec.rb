require 'rails_helper'

describe Professor, type: :model do
  describe 'relationships' do
    it { should have_many :professor_students }
    it { should have_many(:students).through(:professor_students) }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end
end
