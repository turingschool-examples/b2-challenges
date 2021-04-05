class Ride < ApplicationRecord
  has_many :mechanics_rides
  has_many :mechanics, through: :mechanics_rides
end
