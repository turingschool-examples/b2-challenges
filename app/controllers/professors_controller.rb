class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def create
    @professor = Professor.create(professors_params)
    professor.save
    redirect_to "/professors"
  end

  def update
    @professor = Professor.find(params[:id])
    @professor.update(professors_params)
    redirect_to "/professors/#{@professor.id}"
  end

  def destroy
    Professor.destroy(params[:id])
    redirect_to '/professors'
  end

end


private
def professors_params
  params.permit(:name, :age, :specialty)
end
