class MechanicRide <ApplicationRecord
  belongs_to :ride
  belongs_to :mechanic
  def self.return_associated_rides(id)
    associated_rides=MechanicRide.where(mechanic_id: id)
    ride_id= associated_rides.pluck(:ride_id)
    Ride.find(ride_id)
  end
end