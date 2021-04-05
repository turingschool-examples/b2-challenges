require 'rails_helper'

RSpec.describe MaintenanceLog do
    before :each do
        @john = Mechanic.create!(name: 'John Doe', years_experience: 5)
        @ride1 = Ride.create!(name: 'Montu', thrill_rating: 7, open: true)
        @log1 = MaintenanceLog.create!(mechanic_id: @john.id, ride_id: @ride1.id)
    end

    describe 'attributes' do
        it { should belong_to :mechanic }
        it { should belong_to :ride }
    end
end