class Ride < ApplicationRecord
  has_many :mechanics_and_rides
  has_many :mechanics, through: :mechanics_and_rides

  def self.ride_open?
    Ride.where(open: true)
  end
end
