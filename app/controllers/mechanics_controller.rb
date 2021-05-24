class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_thrill
  end

  def add_ride
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create!(mechanic: mechanic, ride: ride)

    redirect_to "/mechanics/#{params[:id]}"
  end

end
