class ProfessorsController < ApplicationController

  # def index
  #   @pets = Pet.all
  # end

  def show
    @professor = Professor.find(params[:id])
    @students = @professor.students
    @average_student_age = @professor.average_student_age
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)
    redirect_to "/professors/#{professor.id}"
  end

  private
  def professor_params
    params.permit(:name, :age, :specialty)
  end

end
