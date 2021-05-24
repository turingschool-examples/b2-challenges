class Ride < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :mechanics, through: :ride_mechanics
end
