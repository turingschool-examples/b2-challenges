class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all

    @average = Mechanic.average_experience
  end
end
