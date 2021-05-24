class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_yrs_exp = Mechanic.avg_yrs_exp
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_rides_by_thrill
  end

end
