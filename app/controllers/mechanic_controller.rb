class MechanicController < ApplicationController

  def index
    @mechanics = Mechnics.all
    @avg_years_exp = Mechanic.all.average(:years_experience)
  end

end