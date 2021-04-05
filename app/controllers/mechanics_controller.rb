class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics.average_experience_in_years
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end
