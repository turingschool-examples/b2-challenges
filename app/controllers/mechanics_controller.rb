class MechanicsController < ApplicationController
    def index
        @mechanics = Mechanic.all
        @experience = Mechanic.experience_summary
    end

    def show
        @mechanic = Mechanic.find(params[:id])
    end
end