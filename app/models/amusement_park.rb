class AmusementPark < ApplicationRecord
  has_many :amusement_park_rides
  has_many :rides, through: :amusement_park_rides
end
