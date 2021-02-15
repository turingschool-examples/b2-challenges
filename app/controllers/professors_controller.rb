class ProfessorsController < ApplicationController
  def index
    @profs = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  private
  def professor_params
    # params.require(:)
    params.permit(:name, :age, :specialty)
  end
end
