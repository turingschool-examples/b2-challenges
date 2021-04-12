class MechanicRidesController < ApplicationController

  def create
    ride = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:mechanic_id])
    MechanicRide.create(ride: ride, mechanic: mechanic)
    # many ways to do line 6
    # mechanic.mechanic_rides << ride
    
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
