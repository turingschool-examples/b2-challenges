class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @a_y_o_e = Mechanic.average_years_of_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    updated_mechanic = Mechanic.find(params[:mechanic])
    ride = Ride.find(params[:ride_id])
    updated_mechanic.rides << ride
    updated_mechanic.save
    redirect_to "/mechanics/#{updated_mechanic.id}"
  end

  private

  def mechanic_params
    params.permit(:id, :name, :years_of_experience)
  end
end
