class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
    @average_student_age = @professor.average_age
  end

  def index
    @professors = Professor.all
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)
    professor.save
    redirect_to "/professors"
  end

  private
  def professor_params
    params.permit(:name, :age, :specialty)
  end
end