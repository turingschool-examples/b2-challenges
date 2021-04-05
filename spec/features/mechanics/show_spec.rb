require 'rails_helper'

RSpec.describe 'mechanic show page' do
    before :each do
        @jane = Mechanic.create!(name: 'Jane Doe', years_experience: 9)
        @ride1 = Ride.create!(name: 'Montu', thrill_rating: 7, open: true)
        @ride2 = Ride.create!(name: 'Cheetah Chase', thrill_rating: 4, open: true)
        @ride3 = Ride.create!(name: 'Sheikra', thrill_rating: 8, open: false)
        
        MaintenanceLog.create!(mechanic_id: @jane.id, ride_id: @ride1.id)
        MaintenanceLog.create!(mechanic_id: @jane.id, ride_id: @ride2.id)
        MaintenanceLog.create!(mechanic_id: @jane.id, ride_id: @ride3.id)
    end
    
    it 'has mechanic attributes' do
        visit "/mechanics/#{@jane.id}"
        
        expect(page).to have_content(@jane.name)
        expect(page).to have_content(@jane.years_experience)
    end

    it 'shows rides mechanic is working on in descending order by thrill rating' do
        visit "/mechanics/#{@jane.id}"

        expect(page).to have_content(@ride1.name)
        expect(page).to have_content(@ride2.name)
        expect(page).to_not have_content(@ride3.name)

        expect(@ride1.name).to appear_before(@ride2.name)
    end
end