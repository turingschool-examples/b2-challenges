class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def create
    @ride = Ride.find(params[:number])
    # @mechanic.rides.find(1)
    # @mechanic.rides.find_or_create_by!(name: "test", thrill_rating: 1, open: true)
    #I need this to find the ride for the mechanic just based off of the params[:number]
    redirect_to '/mechanics/#{mechanic1.id}'
    binding.pry
  end
end
