class ParkRide < ApplicationRecord
  belongs_to :amusement_park
  belongs_to :ride
end
