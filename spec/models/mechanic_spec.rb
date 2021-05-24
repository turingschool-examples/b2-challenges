require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_and_belong_to_many :rides}
  end

  describe 'class method,' do
    describe '#average_experience' do
      it 'returns the average years of experience across all mechanics' do
        Mechanic.create(name: 'Bob', years_experience: 5)
        Mechanic.create(name: 'Mark', years_experience: 10)
        Mechanic.create(name: 'Meggan', years_experience: 3)
        Mechanic.create(name: 'Rich', years_experience: 6)

        expected_avg = 6

        expect(Mechanic.average_experience).to eq expected_avg
      end
    end
  end

  describe 'instance method,' do
    describe '#rides_by_thrill_rating_desc' do
      it 'returns the list of rides the mechanic is working on'

      it 'returns the list in descending order by thrill rating'

      it 'returns the list with rides that are open'
    end
  end
end
