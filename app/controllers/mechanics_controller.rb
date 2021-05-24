class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # @rides = Ride.search(params[:show_rides])
    # @ride = @mechanic.rides
  end

  def new
  end

  def create
    mechanic = Mechanic.create(mechanic_params)
    redirect_to '/mechanics'
  end

  def mechanic_params
    params.permit(:name, :years_of_experience)
  end
end
