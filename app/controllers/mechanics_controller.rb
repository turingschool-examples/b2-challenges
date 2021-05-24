class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_yrs_exp = Mechanic.avg_yrs_exp
  end

end
