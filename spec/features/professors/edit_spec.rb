require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @professor1 = Professor.create!(name: 'Minerva McGonagall', age: 204, specialty: 'Transfiguration')
  end

  describe 'When I click update link' do
    it 'I am taken to a form where I can input a new name, age, and specialty' do
      visit '/professors'
      click_link('Update')

      expect(current_path).to eq("/professors/#{@professor1.id}/edit")
    end
  end
end
# When I click this link,
# Then I am taken to a form where I can input a new name, age, and specialty
# When I click the submit button,
# Then I am taken back to the professors index where I see that professor has been updated
