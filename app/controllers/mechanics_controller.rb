class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.all.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.all
  end
end
