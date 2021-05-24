#spec/features/mechanics/index_spec

require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  describe 'display' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
      @mechanic_2 = Mechanic.create!(name: "Bryan", exp_in_years: 5)
    end
    it 'lists all mechanics and their attributes' do

      
      visit '/mechanics'
   
      expect(page).to have_content("Name")
      expect(page).to have_content("Years of Experience")
      expect(@mechanic_1.name).to appear_before(@mechanic_2.name)
    end

    it 'lists average of experience across all mechanics' do
      visit '/mechanics'

      expect(page).to have_content("Average Years of Experience: 8")
    end
  end
end