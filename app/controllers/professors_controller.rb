class ProfessorsController < ApplicationController 
  def index 
    @professors = Professor.all
  end

  def show 
    @professor = Professor.find(params[:id])
    @students = @professor.student_list(params[:id])
  end
end