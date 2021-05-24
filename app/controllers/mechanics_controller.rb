class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all

    @average = Mechanic.average_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])

    join_table = RideMechanic.where('mechanic_id = ?', @mechanic.id)

    rides = join_table.map do |table|
      Ride.current_rides(table)
      end

    @open_rides = rides.map do |ride|
      Ride.names_for_open_rides_ordered_by_thrill_desc
    end.uniq

    if params[:ride_id] != nil
      RideMechanic.create(ride_id: params[:ride_id], mechanic_id: params[:id])
      redirect_to "/mechanics/#{params[:id]}"
    end
  end
end
