class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:id])
    RideMechanic.create(ride: ride, mechanic: mechanic)
  end

end
