class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @avg_exp = Mechanic.avg_exp
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end
