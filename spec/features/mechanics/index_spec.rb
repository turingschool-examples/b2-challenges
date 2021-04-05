require 'rails_helper'

RSpec.describe 'mechanics index page' do
    before :each do
        @john = Mechanic.create!(name: 'John Doe', years_experience: 5)
        @jane = Mechanic.create!(name: 'Jane Doe', years_experience: 9)
    end
    
    it 'has proper header as well as summary of years of experience' do
        visit '/mechanics'
        
        expect(page).to have_content('All Mechanics')
        expect(page).to have_content(Mechanic.experience_summary)
    end

    it 'has all mechanics and thier years of experience' do
        visit '/mechanics'
        
        expect(page).to have_content(@john.name)
        expect(page).to have_content(@jane.name)

        expect(page).to have_content(@john.years_experience)
        expect(page).to have_content(@jane.years_experience)
    end
end