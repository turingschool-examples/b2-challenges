class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience_in_years
    average(:years_experience)
  end

  def open_rides_by_thrill_rating
    rides.where(open: true).order(thrill_rating: :desc)
  end

  def added_rides(ride)
    all_rides = rides << Ride.find(ride)
    all_rides.where(open: true).order(thrill_rating: :desc)
  end
end
