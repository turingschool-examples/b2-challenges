class Ride < ApplicationRecord
  has_many :mechanics, through: :mechanic_rides
end
