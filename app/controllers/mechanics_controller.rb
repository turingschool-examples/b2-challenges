class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_yrs_exp = Mechanic.average(:years_experience)
  end

end
