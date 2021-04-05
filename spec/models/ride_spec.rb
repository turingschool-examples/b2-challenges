require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  it 'can order rides by :thrill_rating' do
    ride1 = Ride.create!(
      name: "Holy Terror of Babel",
      thrill_rating: 8,
      open: true
    )
    ride2 = Ride.create!(
      name: "REGRETABLE9000",
      thrill_rating: 2,
      open: true
    )
    ride3 = Ride.create!(
      name: "No More Limbs",
      thrill_rating: 4,
      open: true
    )
    ride4 = Ride.create!(
      name: "Last Will and Testament",
      thrill_rating: 3,
      open: false
    )
    expect(Ride.order_desc_by_thrill_rating).to eq([ride1, ride3, ride4, ride2])
  end
end
