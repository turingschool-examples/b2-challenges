class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    #I know line below should have methods in mechanic or ride controller but needed test to pass first
    #will refactor if time allows
    @rides = @mechanic.rides.where("open = true").order("thrill_rating DESC")
    if params[:ride_id]
      @rides = @mechanic.rides.where("open = true").order("thrill_rating DESC")
      redirect_to "/mechanics/#{@mechanic.id}"
    end
  end
end
