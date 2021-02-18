require 'rails_helper'

describe Student, model: :type do
  describe 'relationships' do
    it {should belong_to :professor}
  end
end
