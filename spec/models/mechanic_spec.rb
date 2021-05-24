require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end
  describe "class methods" do
    describe "::average_exp" do
      it 'displays the average experience' do
        jim = Mechanic.create(name:'Jim Bob', years_experience: 2)
        sue = Mechanic.create(name:'Sue', years_experience: 3)
        tim = Mechanic.create(name:'Tim Bob', years_experience: 5)
        tony = Mechanic.create(name:'Tony Saprano', years_experience: 6)
      
        expect(Mechanic.average_exp).to eq(4)
      end
    end
  end
end