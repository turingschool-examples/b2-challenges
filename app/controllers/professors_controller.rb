class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @students_of_professor = Student.students_of_professor(@professor)
    @average_student_age = Student.average_student_age(@professor)
  end

  def update
    
  end
end
