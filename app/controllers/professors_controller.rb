class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
    # @professor.all_students
  end

  # def index
  #   @professors = Professor.all
  # end
end
