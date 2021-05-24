require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'class methods' do
    describe '#average_years' do
      it 'can find the average years of experience of all mechanics' do
        mechanic_1 = Mechanic.create!(name: 'Jim Bob', years_experience: 10)
        mechanic_2 = Mechanic.create!(name: 'Darrel Smith', years_experience: 5)

        expect(Mechanic.average_years).to eq(7.5)
      end
    end
  end
end