require 'rails_helper'

RSpec.describe Ride, type: :model do
  it { should have_many :mechanic_rides }
  it { should have_many(:mechanics).through(:mechanic_rides) }
  it { should belong_to :park }
end
