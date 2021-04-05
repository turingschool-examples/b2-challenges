class RideMechanicsController < ApplicationController

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(id: params[:ride_id])
    RideMechanic.create!(mechanic: mechanic, ride: ride)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
