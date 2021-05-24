class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.is_open?.thrill
    if params[:ride_id]
      @rides = @mechanic.rides.is_open?.thrill
      redirect_to "/mechanics/#{@mechanic.id}"
    end
  end
end
