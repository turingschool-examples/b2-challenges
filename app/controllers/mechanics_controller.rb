class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_thrill
  end

end
