class ProfessorsController < ApplicationController

  def show
    @professor = Professor.find(params[:id])
    @students = ProfessorStudent.where(professor_id: "#{params[:id]}")
  end
end
