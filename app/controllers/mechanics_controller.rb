class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @working = @mechanic.rides_working_on
    if params[:new_ride_id]
      new_ride = Ride.find(params[:ride_id])
      MechanicRide.create!(mechanic: @mechanic, ride:new_ride)
    end
  end
end