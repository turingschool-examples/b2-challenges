class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all

    @average = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])

    join_table = RideMechanic.where('mechanic_id = ?', @mechanic.id)

    @rides = join_table.map do |table|
      Ride.ride_names_for_rides_worked_on(table)
    end
  end
end
