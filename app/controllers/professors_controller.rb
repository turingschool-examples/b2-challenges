class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def new

  end

  def show
    @professor = Professor.find(params[:id])
  end

  def create

  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)

    redirect_to "/professors"
  end

  def destroy
    professor = Professor.find(params[:id])
    student = Student.find(params[:student_id])
    professor_student = professor.professor_students.where(student_id: params[:student_id])
    professor.professor_students.destroy(professor_student)

    redirect_to "/professors/#{professor.id}"
  end

  private
  def professor_params
    params.permit(:name, :age, :speciality)
  end
end
