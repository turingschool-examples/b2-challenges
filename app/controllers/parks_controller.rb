class ParksController < ApplicationController
  def show
    @park = Park.find(params[:id])
    @rides = @park.rides_ordered_alphabetically
  end
end