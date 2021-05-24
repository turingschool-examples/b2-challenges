class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
    # binding.pry
    @my_ride_and_open = @rides.where(:is_open => true ).order('thrill_rating Desc')
  end

  def new
  end

  def create
    mechanic = Mechanic.create(mechanic_params)
    redirect_to '/mechanics'
  end

  def mechanic_params
    params.permit(:name, :years_of_experience)
  end
end
