class MechanicsAndRidesController < ApplicationController

  def create
    ride = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:mechanic_id])
    MechanicsAndRide.create(ride: ride, mechanic: mechanic)

    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
