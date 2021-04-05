class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years
    average(:years_experience)
  end

  def working_rides
    self.rides.where(open: true).order("thrill_rating DESC")
  end
end
