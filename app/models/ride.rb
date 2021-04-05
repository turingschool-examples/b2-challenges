class Ride < ApplicationRecord
   has_many :mechanic_rides
   has_many :mechanics, through: :mechanic_rides
   # belongs_to :amusement_parks

  def self.open_rides
    where(ride_open: true)
  end

  def self.rides_by_thrill
    order(thrill_rating: :desc)
  end
end
