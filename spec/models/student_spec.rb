require 'rails_helper'

RSpec.describe Student do
  describe 'relationships' do
    it { should have_many :professor_students }
    it { should have_many(:professors).through(:professor_students) }
  end
end
