class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.by_thrill_rating_desc
  end

  def add_ride
    @mechanic = Mechanic.find(params[:format])
    @ride = Ride.find(params[:ride_id])
    @mechanic.rides << @ride
    redirect_to mechanic_path(@mechanic)
  end
end
