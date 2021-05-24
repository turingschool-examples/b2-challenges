class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @years_average = Mechanic.exp_in_years_average
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    rides = Ride.show_only_open
    @rides = rides.sort_by_thrill_level
  end

  def add_ride
    mechanic = Mechanic.find(params[:mechanic_id])
    mechanic.rides << Ride.find(params[:ride_id])

    redirect_to "mechanics/#{mechanic.id}"
  end
end