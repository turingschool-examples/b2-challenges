require 'rails_helper'

describe Professor, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :specialty}
  end

  describe 'Relationships' do
    it { should have_many :professor_students }
    it { should have_many(:students).through(:professor_students) }
  end
end

