class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average_years_experience
  end 

end
