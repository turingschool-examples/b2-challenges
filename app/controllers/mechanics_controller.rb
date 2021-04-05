class MechanicsController < ApplicationController
    def index
        @mechanics = Mechanic.all
        @experience = Mechanic.experience_summary
    end

    def show
        @mechanic = Mechanic.find(params[:id])
    end

    def add
        MaintenanceLog.create(mechanic_id: params[:id], ride_id: params[:ride_id])
        redirect_to "/mechanics/#{params[:id]}"
    end
end