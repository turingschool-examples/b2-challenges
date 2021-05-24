require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'class methods' do
    it '.experience_average' do
      mechanic_1 = Mechanic.create!(name: 'Kara Smith', experience: 11)
      mechanic_2 = Mechanic.create!(name: 'Jo Olson', experience: 4)
      mechanic_3 = Mechanic.create!(name: 'Letty Ortiz', experience: 9)
      
      expect(Mechanic.experience_average).to eq(8)
    end
  end
end
