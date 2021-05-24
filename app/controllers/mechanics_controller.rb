class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average_years_experience
  end

  def show
    if !params[:ride_id].nil?
      @ride = Ride.find(params[:ride_id])
      @mechanic = Mechanic.find(params[:id])
      @mechanic.rides << @ride
      @rides = @mechanic.sorted_open_rides_thrill
    end
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.sorted_open_rides_thrill

  end
end
