require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: 'Bob', years_experience: 3)
      @mechanic_2 = Mechanic.create!(name: 'Mark', years_experience: 6)
      @mechanic_3 = Mechanic.create!(name: 'Mark', years_experience: 7)
    end

    describe '::average_years_experience' do
      it "returns the average years of experience" do
        expect(Mechanic.average_years_experience.round(2)).to eq(5.33)
      end
    end
  end
end
