class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    if params[:add_ride].present?
      @mechanic = Mechanic.find(params[:id])
      if @mechanic.rides.include?(Ride.find(params[:add_ride]))
        @mechanic = Mechanic.find(params[:id])
      else
        @mechanic.rides << Ride.find(params[:add_ride])
      end
    else
      @mechanic = Mechanic.find(params[:id])
    end
  end
end
