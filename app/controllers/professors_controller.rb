class ProfessorsController < ApplicationController

  # def index
  #   @pets = Pet.all
  # end

  def show
    @professor = Professor.find(params[:id])
    @students = @professor.students
  end

  # def edit
  #   @pet = Pet.find(params[:id])
  # end
  #
  # def update
  #   pet = Pet.find(params[:id])
  #   pet.update(pets_params)
  #   redirect_to "/pets/#{pet.id}"
  # end
  #
  # def destroy
  #   Pet.destroy(params[:id])
  #   redirect_to '/pets'
  # end

end
