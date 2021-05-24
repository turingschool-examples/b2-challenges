class MechanicsController < ApplicationController
  def index
    @average = Mechanic.average_years
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    rides_open = @mechanic.rides.where(open: true)
    @rides = rides_open.sort_thrill
  end
end