class MechanicController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_years_exp = Mechanic.all.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find params[:id]
    @rides = @mechanic.rides.where(open: true).order(thrill_rating: :desc)
    @other_rides = Ride.where.not(id: @rides.ids)
  end

  def add_ride
    mechanic = Mechanic.find params[:id]
    ride = Ride.find params[:ride]
    mechanic.rides << ride
    redirect_to mechanic_show_path mechanic
  end

end