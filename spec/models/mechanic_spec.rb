require 'rails_helper'

RSpec.describe Mechanic do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Lois Iddrisu', years_of_experience: 6)
    @mechanic_3 = Mechanic.create!(name: 'Bob Stewart', years_of_experience: 7)
  end

  describe 'relationships' do
    it {should have_many(:rides).through(:mechanics_rides)}
  end

  it 'can find the average years of experience for all mechanics' do
    expect(Mechanic.average_years_experience).to eq(8)
  end

  
end
