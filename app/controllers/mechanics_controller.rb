class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def new
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    @mechanic = Mechanic.find(params[:id])
    @mechanic.ride = MechanicRide.find(params[:ride_id])
    @new_ride = MechanicRide.create(mechanic_ride_params(@mechanic.ride))

    redirect_to "/mechanics/#{@mechanic.id}"
  end

  private

  def mechanic_ride_params(ride)
    ride.params.permit(:id, :name, :thrill_rating, :open)
  end
end
