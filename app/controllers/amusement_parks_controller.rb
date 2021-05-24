class AmusementParksController < ApplicationController

  def show
    @amusement_park = AmusementPark.find(params[:id])
    @rides = @amusement_park.rides.order(thrill_rating: :desc)
    @average = @amusement_park.average_thrill
  end

end
