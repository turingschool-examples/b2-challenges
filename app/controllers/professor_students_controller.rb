class ProfessorStudentsController < ApplicationController
  def destroy
    professor_student = ProfessorStudent.where(professor_id: params[:id])
    professor = Professor.find(params[:id])
    # ProfessorStudent.destroy(professor_student.id)

    redirect_to "/professors/#{professor.id}"
  end
end
