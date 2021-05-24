class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average_years_exp
  end
end