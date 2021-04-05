class MechanicsController < ApplicationController
    def index
        @mechanics = Mechanic.all
        @experience = Mechanic.experience_summary
    end
end