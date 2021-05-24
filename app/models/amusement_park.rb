class AmusementPark < ApplicationRecord
  has_many :rides, through: :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  has_many :ride_mechanics
end
