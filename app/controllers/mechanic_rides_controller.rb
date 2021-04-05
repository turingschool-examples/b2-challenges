class MechanicRidesController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    MechanicRide.create(mechanic_id: (params[:mechanic_id]), ride_id: (params[:ride_id]))
    redirect_to mechanic_path(@mechanic)
    # @mechanic = Mechanic.find(params[:mechanic_id])
    # @ride = Ride.find(params[:ride_id])
    # MechanicRide.create(mechanic: @mechanic, ride: @ride)
    # redirect_to mechanic_path(@mechanic)
  end
end
