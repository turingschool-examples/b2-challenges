require 'rails_helper'

RSpec.describe 'New Ride' do
  describe 'When I visit a mechanic show page' do
    it 'S3: I see a form to add a ride to mechanic workload' do
      mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
      whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
      hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
      topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
      bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)

      visit "/mechanics/#{mechanic_1.id}"
      click_link 'Add Ride for Repair'
      expect(current_path).to eq ("/mechanics/#{mechanic_1.id}/rides/new")
      expect(find('form')).to have_content ('Add Ride to Workload')
    end
  end

    it 'S3: After submitting ride addition form I am taken back to mechanic show page' do
      describe 'where I see name of newly added ride' do
      mechanic_1 = Mechanic.create(name: 'Jeffrey Dee', years_experience: 7)
      whirly_doo = mechanic_1.rides.create(name: 'Whirly Doo', thrill_rating: 1, open: false)
      hold_on = mechanic_1.rides.create(name: 'Hold On To Yer Butts', thrill_rating: 9, open: true)
      topsy = mechanic_1.rides.create(name: 'Topsy Turvey', thrill_rating: 3, open: true)
      bad_idea = mechanic_1.rides.create(name: 'Was A Bad Idea', thrill_rating: 10, open: true)
      send_you_packin = Ride.create(name: 'This One Will Send You Packin', thrill_rating: 10, open: true)

      visit "/mechanics/#{mechanic_1.id}/rides/new"
      fill_in 'Add Ride to Workload', with: 'This One Will Send You Packin'
      click_button 'Submit'
      expect(current_path).to eq ("/mechanics/#{mechanic_1.id}/rides")
      expect(page).to have_content('This One Will Send You Packin')
    end
  end
end
