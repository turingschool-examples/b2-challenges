class ProfessorsController < ApplicationController
	def index
		
	end

	def show
		@professor = Professor.find(params[:id])
	end

	def new
		
	end

	def create
		professor = Professor.new(professor_params)
		professor.save
		redirect_to "/professors/#{professor.id}"
	end

	private
	def professor_params
    params.require(:professor).permit(:name, :age, :specialty)
  end

end