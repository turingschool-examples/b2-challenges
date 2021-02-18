class ProfessorsController < ApplicationController

  def show
    @professor = Professor.find(params[:id])
  end
  
  def index
    @professors = Professor.all
  end
  
  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    @professor = Professor.find(params[:id])
    if params[:student_id]
      roll = Roll.find_by(student_id: params[:student_id], professor_id: params[:id])
      Roll.destroy(roll.id)
      redirect_to professor_path(@professor)
    else
      @professor.update(professor_params)
      redirect_to professors_path
    end
  end

  private
  def professor_params
    params.permit(:name, :age, :specialty)
  end
end