class MechanicController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_years_exp = Mechanic.all.average(:years_experience)
  end

  def show
    @mechanic = Mechanic.find params[:id]
    @rides = @mechanic.rides.where(open: true).order(thrill_rating: :desc)
  end

end