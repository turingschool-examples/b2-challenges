require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When i visit a professor show page' do
    it 'display professors with attributes' do
     professor1 = Professor.create!(name: 'Mr. Potter', age: 300, specialty: 'Transfiguration')
     professor2 = Professor.create!(name: 'Mrs. Kat', age: 400, specialty: 'Potions')

     visit '/professors'

     expect(page).to have_content(professor1.name)
     expect(page).to have_content(professor1.age)
     expect(page).to have_content(professor1.specialty)
     expect(page).to have_content(professor2.name)
     expect(page).to have_content(professor2.age)
     expect(page).to have_content(professor2.specialty)
   end
 end
end
