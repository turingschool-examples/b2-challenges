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
    @professor = Professor.find(params[:id])
    @professor.update(update_params)
    @professor.save
    redirect_to "/professors"
  end

  private

  def update_params
    params.permit(:name, :age, :specialty)
  end
end
