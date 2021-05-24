class AmusementParksController < ApplicationController
  def show
    @amusement_parks = AmusementPark.all
  end
end
