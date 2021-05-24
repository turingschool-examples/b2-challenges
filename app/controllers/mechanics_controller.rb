class MechanicsController < ApplicationController
  def index
    @average = Mechanic.average_years
    @mechanics = Mechanic.all
  end
end