require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @professor1 = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
    @professor2 = Professor.create!(name: 'Remus Lupin', age: 204, specialty: 'Defense')
    @professor3 = Professor.create!(name: 'Gilderoy Lockhart', age: 204, specialty: 'Defense')
  end

  describe 'When I visit the professor index' do
    it 'I see the name of each professor' do
      visit '/professors'

      within(".professor_list") do
        expect(page).to have_content(@professor1.name)
        expect(page).to have_content(@professor2.name)
        expect(page).to have_content(@professor3.name)
      end
    end

    it 'next to each professor I see a link to "Update"' do
      visit '/professors'

      within(".professor_list") do
        expect(page).to have_link('Update')
      end
    end
  end
end
