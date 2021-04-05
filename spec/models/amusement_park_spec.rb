require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  before(:each) do
    @fiveflags = AmusementPark.create!(name: 'Five Flags', price: 25)
  end

  describe 'relationships' do
    it {should have_many :rides}
  end
end 
