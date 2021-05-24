class Mechanic < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :rides, through: :ride_mechanics

  def self.avg_years_experience
    average(:years_experience).to_i
  end

  def rides_by_thrill_rating
    rides.order(thrill_rating: :desc)
  end
end
