class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
    @students = @professor.students
  end
end
