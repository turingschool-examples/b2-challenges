class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @years_average = Mechanic.exp_in_years_average
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end