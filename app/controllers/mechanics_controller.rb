class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  # def create
  #
  # end
end
