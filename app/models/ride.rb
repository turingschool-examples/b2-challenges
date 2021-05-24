class Ride < ApplicationRecord
  has_many :mechanics_ride
  has_many :mechanics, through: :mechanics_ride


  # def open_rides
  #   where(:is_open => true )
  # end
end
