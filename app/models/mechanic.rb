class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.avg_exp
    average(:years_experience).round
  end

  def open_important_rides
    self.rides.where(open: true).order(thrill_rating: :desc)
  end
end
