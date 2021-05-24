class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average = Mechanic.all.average(:years_experience)
  end
end
