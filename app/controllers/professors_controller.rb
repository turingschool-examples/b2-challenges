class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)
    professor.save
    redirect_to '/professors'
  end

  def unenroll_student
    professor_id = params[:id]
    student_id = params[:unenroll_student_id]
    professor_student = ProfessorStudent.find_by(professor_id, student_id)
    ProfessorStudent.destroy(professor_student.id)
    redirect_to '/professors'
  end

  private

  def professor_params
    params.permit(:name, :age, :specialty)
  end
end
