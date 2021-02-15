class ProfessorsController < ApplicationController
  def index
    @profs = Professor.all
  end

  private
  def professor_params
    # params.require(:)
    params.permit(:name, :age, :specialty)
  end
end
