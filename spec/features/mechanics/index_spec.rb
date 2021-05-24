require 'rails_helper'

RSpec.describe 'mechanic index page' do
  context 'header' do
    it 'has a header' do
      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
    end
  end
end
