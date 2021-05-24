class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # @open_rides = @mechanic.rides.where(open: true)
    # @open_rides.thrill_rating_order
  end
end
