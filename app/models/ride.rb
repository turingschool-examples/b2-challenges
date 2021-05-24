class Ride < ApplicationRecord
  has_many :mechnic_rides
  has_many :mechanics, through: :mechnic_rides
end
