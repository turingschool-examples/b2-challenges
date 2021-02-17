require 'rails_helper'

describe Professor, type: :model do
  describe 'Relationships' do
    it { should have_many :professor_students }
    it { should have_many(:students).through(:professor_students) }
  end
end

