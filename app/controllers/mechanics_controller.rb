class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics.average_years
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def edit
  @mechanic = Mechanic.find(params[:id])
  end


  def update
    @ride = Ride.find(params[:ride_id])
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = MechanicRide.create(ride: @ride, mechanic: @mechanic)
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end
