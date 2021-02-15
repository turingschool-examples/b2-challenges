class ProfessorStudentsController < ApplicationController
  def destroy
    pair = ProfessorStudent.where(professor_id: "#{params[:professor_id]}", student_id: "#{params[:student_id]}")

    ProfessorStudent.destroy(pair.first.id)
    redirect_to "/professors/#{params[:professor_id]}"
  end
end
