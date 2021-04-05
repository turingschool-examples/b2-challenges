require "rails_helper"

describe Mechanic, type: :model do
   describe "relationships" do
      it {should have_many(:mechanic_rides)}
      it {should have_many(:rides).through(:mechanic_rides)}
   end

   describe 'class methods' do
   before :each do
     @mechanic_1 = Mechanic.create!(name: "Joey", years: 6)
     @mechanic_2 = Mechanic.create!(name: "Bobby", years: 14)
     @mechanic_3 = Mechanic.create!(name: "Annie", years: 23)
   end

   it '::average_experience' do
     expect(Mechanic.average_experience).to eq(14.33)
     end
   end
end
