class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.is_open?
    where("open = true")
  end

  def self.thrill
    order("thrill_rating DESC")
  end
end
