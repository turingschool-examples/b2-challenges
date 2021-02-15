class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end
  def show
    @professor = Professor.find(params[:id])
  end
  def edit
    @professor = Professor.find(params[:id])
  end
  def update
    professor = Professor.find(params[:id])
    professor.update(professors_params)
    redirect_to '/professors'
  end

  private
  def professors_params
    params.permit(:name, :age, :specialty)
  end
end
