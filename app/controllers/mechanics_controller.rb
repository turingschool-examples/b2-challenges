class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    require "pry"; binding.pry
    @mechanic_rides = MechanicRide.first(params[:mechanic_id])
  end

  def new
  end

  def create
    mechanic = Mechanic.create!(mechanic_params)

  end

  private

  def mechanic_params
    params.permit(:name, :years_experience)
  end
end
