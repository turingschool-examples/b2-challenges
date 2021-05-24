class Ride < ApplicationRecord
  belongs_to :mechanic

  def self.open_rides
    Ride.where.not(open: false)
  end
end