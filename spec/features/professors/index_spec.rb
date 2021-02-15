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
        expect(page).to have_content(@professor1)
        expect(page).to have_content(@professor2)
        expect(page).to have_content(@professor3)
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


# When I click this link,
# Then I am taken to a form where I can input a new name, age, and specialty
# When I click the submit button,
# Then I am taken back to the professors index where I see that professor has been updated
