class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def add_ride
    mechanic = Mechanic.find(params[:id])
    requested_ride = Ride.find(params[:ride_id])
    mechanic.rides << requested_ride
    redirect_to "/mechanics/#{mechanic.id}"
  end

end
