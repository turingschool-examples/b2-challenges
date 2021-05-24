class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience
    total = sum(:experience)
    (total.to_f / self.all.count).round(2)
  end

  def rides_working_on
    associated_ids = MechanicRide.where("mechanic_id = ?", self.id).pluck(:ride_id)
    working = Ride.where(id: associated_ids)
    working.open_by_thrill
  end
end