class Mechanic < ApplicationRecord
  has_many :rides, through: :mechanic_rides
end
