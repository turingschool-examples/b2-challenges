require 'rails_helper'

describe Professor, type: :model do
  describe 'relationships' do
    it { should have_many :students }
  end
end