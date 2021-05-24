class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average_years_exp
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @open_rides = @mechanic.all_open_rides_listed_by_thrill
  end
end