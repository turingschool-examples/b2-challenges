class Ride < ApplicationRecord
  belongs_to :mechanic

  default_scope {order(thrill_rating: :desc)}

  def self.open_rides
    Ride.where.not(open: false)
  end
end