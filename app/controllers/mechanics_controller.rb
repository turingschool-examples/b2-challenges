class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.all.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = Ride.where(open: true)
    #@rides = Ride.order(thrill_rating: :desc)
    Ride.create(name: params[:name])
  end


end
