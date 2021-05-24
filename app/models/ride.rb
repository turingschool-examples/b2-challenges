class Ride < ApplicationRecord
  has_many :mechanics_ride
  has_many :mechanics, through: :mechanics_ride
end
