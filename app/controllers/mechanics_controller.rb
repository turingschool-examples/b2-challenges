class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @avg_exp = Mechanic.avg_exp
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def add
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])

    mechanic.rides << ride

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
