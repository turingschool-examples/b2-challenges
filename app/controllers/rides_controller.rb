class RidesController < ApplicationController

  def new
    @rides = Ride.all
  end

  def create
  end
end
