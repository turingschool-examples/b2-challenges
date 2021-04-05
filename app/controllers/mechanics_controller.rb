class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = MechanicsAndRide.where(mechanic_id: params[:ride_id])
    @ride_info = Ride.where(@rides.params[:ride_id] params[id])
  end
end
