class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
    # @professor.all_students
  end

  def index
    @professors = Professor.all
    # @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(params)
    redirect_to "/professors"
  end
end
