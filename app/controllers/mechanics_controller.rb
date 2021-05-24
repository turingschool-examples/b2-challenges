class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @working = @mechanic.rides_working_on
  end
end