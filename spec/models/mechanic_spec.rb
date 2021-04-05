require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  it 'can return an average of all the years of experience for mechanics' do
    mech1 = Mechanic.create!(
      name: "Bob",
      years_experience: 12
    )
    mech1 = Mechanic.create!(
      name: "Bobette",
      years_experience: 15
    )

    expect(Mechanic.average_years_experience).to eq(13.5)
  end
end
