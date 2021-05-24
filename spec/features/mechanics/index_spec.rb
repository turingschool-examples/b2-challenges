#spec/features/mechanics/index_spec

require 'rails_helper'

RSpec.describe 'Mechanics index page' do
  describe 'display' do
    it 'lists all mechanics and their attributes' do
      mechanic_1 = Mechanic.create!(name: "Ryan", exp_in_years: 11)
      mechanic_2 = Mechanic.create!(name: "Bryan", exp_in_years: 5)
      
      visit '/mechanics'
   
      expect(page).to have_content("Name")
      expect(page).to have_content("Years of Experience")
      expect(mechanic_1.name).to appear_before(mechanic_2.name)
    end
  end

end