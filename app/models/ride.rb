class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.open_rides
    where(open: true)
  end

  def self.order_by_rating
    order("trill_rating DESC")
  end

  def self.average_trill_rating
    average(:trill_rating)
  end
end
