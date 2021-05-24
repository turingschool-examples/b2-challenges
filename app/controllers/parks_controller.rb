class ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @rides = @park.rides.order(:name)
    @avg_thrill = @rides.average(:thrill_rating).round(2)
  end
end
