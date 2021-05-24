class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    if params[:ride_id].present?
      @mechanic.rides << Ride.find(params[:ride_id])
    end
  end
end
