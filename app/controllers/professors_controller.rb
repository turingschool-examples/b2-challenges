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
end