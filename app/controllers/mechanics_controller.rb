class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
  def ride_order
    @rides = MechanicsAndRide.where(mechanic_id: params[:ride_id])
    @ride_info = Ride.where(@rides.params[:ride_id] params[id])
    @ride_info.order('Thrill Score DESC')
  end

  def create
    new_ride = MechanicsAndRide.new({mechanic_id: params[:mechanic_id],
    ride_id: params[:ride_id]})
  end

end
