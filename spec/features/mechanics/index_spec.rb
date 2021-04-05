require 'rails_helper'

RSpec.describe 'As a visitor' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Joey", years: 6)
      @mechanic_2 = Mechanic.create!(name: "Bobby", years: 14)
      @mechanic_3 = Mechanic.create!(name: "Annie", years: 23)

      visit '/mechanics'
    end

    describe 'when i visit the mechanics index page' do
    it 'I see a header saying “All Mechanics”' do
        expect(page).to have_content("All Mechanics")
      end

    it 'list of all mechanics and their attributes' do

      expect(page).to have_content("#{@mechanic_1.name}")
      expect(page).to have_content("#{@mechanic_1.years} years of experience")
      expect(page).to have_content("#{@mechanic_2.name}")
      expect(page).to have_content("#{@mechanic_2.years} years of experience")
      expect(page).to have_content("#{@mechanic_3.name}")
      expect(page).to have_content("#{@mechanic_3.years} years of experience")
    end

    # it "And i see the average years of experience across all mechanics" do
    #
    # end
  end
end
