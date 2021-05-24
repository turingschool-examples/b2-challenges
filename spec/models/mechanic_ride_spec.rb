require 'rails_helper'

RSpec.describe 'mechanic ride' do
  describe 'relationship' do
    it {should belong_to :mechanic}
    it {should belong_to :ride}
  end
end
