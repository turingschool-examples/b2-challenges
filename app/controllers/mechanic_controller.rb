class MechanicController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_years_exp = Mechanic.all.average(:years_experience)
  end

end