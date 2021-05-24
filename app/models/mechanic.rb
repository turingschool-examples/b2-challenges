class Mechanic < ApplicationRecord
  has_many :mechnic_rides
  has_many :rides, through: :mechnic_rides
end
