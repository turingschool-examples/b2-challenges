class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    # @shelter = Shelter.find(params[:shelter_id])
  end

end
