require 'rails_helper'

RSpec.describe Mechanic, type: :model do
    before :each do
        @john = Mechanic.create!(name: 'John Doe', years_experience: 5)
    end

    describe 'attributes' do
        it { should have_many :maintenance_logs }
        it { should have_many :rides }
        it { should validate_presence_of :name }
        it { should validate_presence_of :years_experience }
    end
end