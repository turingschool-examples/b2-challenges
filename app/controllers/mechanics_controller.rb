class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @average = Mechanic.average(:years_experience)
  end

end
