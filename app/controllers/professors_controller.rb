class ProfessorsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
    # require "pry"; binding.pry
  end

  # def index
  #   @professors = Professor.all
  # end
end
