class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years_experience
    average(:years_experience)
  end

  def self.is_open?
    self.rides.where("open = true")
  end
end
