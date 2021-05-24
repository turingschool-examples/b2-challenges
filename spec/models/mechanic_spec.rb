require 'rails_helper'

RSpec.describe 'Mechanics model' do

  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

end
