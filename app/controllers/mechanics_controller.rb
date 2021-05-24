class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:mechanic_id])
    if params[:add_ride]
      @mechanic.rides << Ride.find(params[:add_ride][:ride_id])
    end
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
