class ProfessorStundentsController < ApplicationController

  def update
    @student = Student.find(params[:student_id])
    @professor = Professor.where(params[:professor_id])
    redirect_to "/professors/#{@professor.id}"
  end

  def destroy
    @professor_student = ProfessorStudent.find(params[:professor_id])
    ProfessorStudent.destroy(params[:id])
    redirect_to "/professors/#{@professor_student.professor_id}"
  end

end
