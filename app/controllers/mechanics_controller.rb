class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.sorted_open_rides_thrill
  end
end
