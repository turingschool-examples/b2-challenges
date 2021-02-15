class ProfessorsController < ApplicationController 
  def index 
    @professors = Professor.all
  end

  def show 
    @professor = Professor.find(params[:id])
    @students = @professor.student_list(params[:id])
    @avg_age = @professor.average_age(@students)
  end
end