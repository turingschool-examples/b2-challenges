class ProfessorStudentsController < ApplicationController
  def destroy
    ProfessorStudent.where(:professor_id => params[:id], :student_id => params[:student_id]).destroy_all
    redirect_to "/professors/#{params[:id]}"
  end
end
