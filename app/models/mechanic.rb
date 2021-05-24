class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience
    average(:years_experience)
  end

  def rides_working_on
    ride_ids = MechanicRide.where(mechanic: self.id).pluck(:ride_id)
    rides = Ride.sort_by_thrill_filter_open.where(id: ride_ids)
  end
end