class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics.average_experience_in_years
  end

  def show
    @mechanic = Mechanic.find(params[:id])

    if params[:search]
      @mechanic_rides = @mechanic.added_rides(params[:search])
    else
      @mechanic_rides = @mechanic.open_rides_by_thrill_rating
    end
  end
end
