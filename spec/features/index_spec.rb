require 'rails_helper'

RSpec.describe 'The index page for mechanics,' do

  before :all do
    @mech_1 = Mechanic.create(name: 'Bob', years_experience: 12)
    @mech_2 = Mechanic.create(name: 'Rich', years_experience: 6)
  end

  before :each do
    visit '/mechanics'
  end

  after :all do
    Mechanic.destroy_all
  end

  it 'should have a header' do
    expect(page).to have_selector('h2', text: 'All Mechanics')
  end

  it 'shows average years of experience across all mechanics' do
    within '#mechanics_section' do
      expect(page).to have_selector('h3', text: "Average Years Experience for all: #{Mechanic.average_experience}")
    end
  end

  describe 'list of mechanics,' do
    it 'shows all the mechanics with their name and experience' do
      expect(page).to have_selector('#mechanics_list')

      within "#mechanic_#{@mech_1.id}" do
        expect(page).to have_link(@mech_1.name)
        expect(page).to have_content(@mech_1.years_experience)
      end

      within "#mechanic_#{@mech_2.id}" do
        expect(page).to have_link(@mech_2.name)
        expect(page).to have_content(@mech_2.years_experience)
      end
    end
  end
end
