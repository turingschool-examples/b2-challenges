class Ride < ApplicationRecord
  has_many :mechanics_and_rides
  has_many :mechanics, through: :mechanics_and_rides

  # def self.ride_open?
  #   where(open: true)
  #   order('thrill_score DESC')
  # end

#   def self.order_by_thrill_score
#     order('thrill_score DESC')
#   end
end
