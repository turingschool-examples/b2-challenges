class RideMechanicsController < ApplicationController
  def new
    @mech_id = params[:mech_id]
  end
  def create
    work = RideMechanic.create(ride_id:params[:rideid], mechanic_id: params[:mech_id])
    redirect_to "/mechanics/#{params[:mech_id]}"
  end
end
