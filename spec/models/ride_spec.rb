require 'rails_helper'

RSpec.describe Ride do
    before :each do
        @ride1 = Ride.create!(name: 'Montu', thrill_rating: 7, open: true)
    end

    describe 'attributes' do
        it { should have_many :maintenance_logs }
        it { should have_many :mechanics }
        it { should validate_presence_of :name }
        it { should validate_presence_of :thrill_rating }
    end
end