require 'rails_helper'

describe Student, type: :model do
  describe 'relationships' do
    it {should belong_to :professor}
  end
end 
