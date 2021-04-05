require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'class methods' do
    it 'can average years' do
      steve = Mechanic.create!(name: "Steve Brown", years_of_experience: 27)
      doug = Mechanic.create!(name: "Doug Wood", years_of_experience: 17)
      greg = Mechanic.create!(name: "Greg Marshall", years_of_experience: 10)

      expect(Mechanic.average_years).to eq(18.0)
    end
  end
end