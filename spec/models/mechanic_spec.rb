require "rails_helper"

describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many (:mechanics_and_rides)}
    it {should have_many(:rides).through(:mechanics_and_rides) }
  end
  describe "class methods" do
    before :each do
      @mechanic1 = Mechanic.create!(name: 'Josie', years_of_experience: 3)
      @mechanic2 = Mechanic.create!(name: 'Emmy', years_of_experience: 5)
      @mechanic3 = Mechanic.create!(name: 'Bella', years_of_experience: 1)
    end

    describe "::average_years_experience" do
      it 'returns the average years of experience' do
        expect(Mechanic.average_years_experience.round(2)).to eq(4.00)
      end
    end
  end

  describe "instance methods" do
    before :each do
      @mechanic1 = Mechanic.create!(name: 'Josie', years_of_experience: 3)
      @ride1 = @mechanic1.rides.create!(name: 'Spooky Coaster', open: true, thrill_score: 10)
      @ride2 = @mechanic1.rides.create!(name: 'Thrill Factory', open: true, thrill_score: 3)
      @ride3 = @mechanic1.rides.create!(name: 'Jurrasic Journey', open: true, thrill_score: 15)
    end
    describe '#open_rides_by_thrills' do
      it 'returns rides that are open in thrill order descending' do
        expect(@mechanic.open_rides_by_thrills).to eq([@ride3, @ride1, @ride2])
      end
    end
  end
end
