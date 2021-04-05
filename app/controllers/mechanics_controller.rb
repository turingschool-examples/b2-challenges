class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @a_y_o_e = Mechanic.average_years_of_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end
