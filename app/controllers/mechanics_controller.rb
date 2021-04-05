class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    open_rides = @mechanic.mechanics_open_rides
    @rides = open_rides.order_rides_by_thrill
  end
  
  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:new_ride])
    @mechanic = mechanic.rides << ride
    
    @all_rides = mechanic.rides
    redirect_to "/mechanics/#{mechanic.id}"
  end
end