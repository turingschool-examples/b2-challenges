class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average_years_exp
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end