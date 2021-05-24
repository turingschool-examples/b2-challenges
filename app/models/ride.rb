class Ride < ApplicationRecord
  belongs_to :mechanic, optional: true #is this ok?

  default_scope {order(thrill_rating: :desc)}

  def self.open_rides
    Ride.where.not(open: false)
  end
end