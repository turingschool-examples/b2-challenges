class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.sort_thrill
    order(thrill_rating: :desc)
  end
end