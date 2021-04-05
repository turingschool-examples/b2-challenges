class RidesController < ApplicationController

  def index
    @rides = Ridel.all
  end
end
