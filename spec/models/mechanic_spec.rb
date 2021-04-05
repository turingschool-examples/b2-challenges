require 'rails_helper'

RSpec.describe Mechanic, type: :model do
    before :each do
        @john = Mechanic.create!(name: 'John Doe', years_experience: 5)
        @jane = Mechanic.create!(name: 'Jane Doe', years_experience: 9)

        @ride1 = Ride.create!(name: 'Montu', thrill_rating: 7, open: true)
        @ride2 = Ride.create!(name: 'Sheikra', thrill_rating: 8, open: false)
        MaintenanceLog.create!(mechanic_id: @jane.id, ride_id: @ride1.id)
        MaintenanceLog.create!(mechanic_id: @jane.id, ride_id: @ride2.id)
    end

    describe 'attributes' do
        it { should have_many :maintenance_logs }
        it { should have_many :rides }
        it { should validate_presence_of :name }
        it { should validate_presence_of :years_experience }
    end

    describe '.experience_summary' do
        it 'summarizes years of experience for all mechanics' do
            expect(Mechanic.experience_summary).to eq(7.0)
        end
    end

    describe '#active_rides' do
        it 'shows only rides that are open' do
            expect(@jane.active_rides.count).to eq(1)
        end
    end
end