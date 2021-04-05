class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  # def average_experience
  #   # @shelter = Shelter.find(params[:shelter_id])
  # end

end
