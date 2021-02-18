class StudentsController < ApplicationController
  def update
    student = Student.find(params[:id])
    student.update(stduent_params)
    student.save
    redirect_to "/professors/#{student.professor.id}"
  end

  private
  def stduent_params
    params.permit(:status)
  end
end