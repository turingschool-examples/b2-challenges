class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @mechanics.average_years
  end
end
