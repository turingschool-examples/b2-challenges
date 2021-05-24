class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mech_avg = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.where(open: true).pluck(:name)
  end

  def new
  end



  private

  def mechanic_params
    params.permit(:name, :years_experience)
  end
end
