#spec/features/mechanics/show_spec

require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  describe 'display' do
    before :each do
      @mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
    end
    
    it 'lists mechanic and their attributes' do
      visit "/mechanics/#{@mechanic_1.id}"
   
      expect(page).to have_content("Name")
      expect(page).to have_content("Years of Experience")
      expect(page).to have_content("Working on Current Rides")
    end
  end
end