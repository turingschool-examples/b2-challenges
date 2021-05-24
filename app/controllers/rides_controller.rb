class RidesController < ApplicationController


  def new
  end

  def create
    ride = Ride.create(rides_params)
    redirect_to "/mechanics/#{ride.mechanic_id}"
  end

  private
  def rides_params
    params.permit(:name, :thrill_rating, :open, :mechanic_id)
  end
end