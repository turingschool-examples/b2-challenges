class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def show

  end

  def new
  end

  def create
    ride = Ride.create(ride_params)
    redirect_to '/rides'
  end

  def ride_params
    params.permit(:name, :thrill_rating, :is_open)
  end
end
