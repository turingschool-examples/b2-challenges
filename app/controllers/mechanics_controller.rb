class MechanicsController < ApplicationController
  def index
    @average = Mechanic.average_years
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end