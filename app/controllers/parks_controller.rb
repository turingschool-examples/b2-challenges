class ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @rides = @park.rides.rides_by_name
    @avg_thrill = @rides.avg_thrill
  end
end
