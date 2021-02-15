class ProfessorsController < ApplicationController 
  def index 
    @professors = Professor.all
  end

  def show 
    @professor = Professor.find(params[:id])
    @students = @professor.student_list(params[:id])
    @avg_age = @professor.average_age(@students)
  end

  def update 
    @professor = Professor.find(params[:id])
  end

  def patch 
    @professor = Professor.find(params[:id])
    @professor.update(name: params[:name],
                      age: params[:age],
                      specialty: params[:specialty])
      redirect_to '/professors'
  end
end