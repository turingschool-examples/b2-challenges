class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @ride = @mechanic.rides
    binding.pry
    if params[:is_open?]
      @ride.name
    end
  end
end
