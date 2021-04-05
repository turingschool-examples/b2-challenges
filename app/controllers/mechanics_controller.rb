class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.mechanics_open_rides
  end
end