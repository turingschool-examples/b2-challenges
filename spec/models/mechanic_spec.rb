require 'rails_helper'

RSpec.describe Mechanic, type: :model do

  describe 'class methods' do
    describe '#average_years_exp' do
      it 'can calculate the average of the mechanics years of experience' do
        Bobby= Mechanic.create!(name: "Bobby", years_experience: 10)
        Greg = Mechanic.create!(name: "Greg", years_experience: 10)
        James = Mechanic.create!(name: "James", years_experience: 5)
        Derris = Mechanic.create!(name: "Derris", years_experience: 5)

        expect(Mechanic.average_years_exp).to eq(7.5)
      end
    end
  end
end