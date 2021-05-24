class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
  end



  private

  def ride_params
    params.permit(:name, :thrill_rating, :open)
  end
end
