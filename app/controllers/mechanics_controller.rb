class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    if params.keys.include? 'ride_id'
      @ride = Ride.find(params[:ride_id])
      MechanicRide.create!(ride: @ride, mechanic: @mechanic)
    end
  end
end