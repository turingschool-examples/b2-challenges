class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_experience
    average(:years_experience)
  end

  def thrill_rating_order_on_open_rides
    rides.order(thrill_rating: :desc).where(open: true)
  end
end
