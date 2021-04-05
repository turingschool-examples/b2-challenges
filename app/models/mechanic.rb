class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_experience
    average(:experience).to_f
  end

  def mechanics_open_rides
    rides.where(open: true)
  end
end