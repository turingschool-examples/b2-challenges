class Ride < ApplicationRecord
  has_and_belongs_to_many :mechanic

  default_scope {order(thrill_rating: :desc)}

  def self.open_rides
    Ride.where.not(open: false)
  end
end