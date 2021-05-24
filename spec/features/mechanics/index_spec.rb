require 'rails_helper'
# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics

RSpec.describe 'mechanic index page' do
  before(:each) do  
    @mechanic_1 = Mechanic.create!(name: "Dee", years_experience: 20)  
    @mechanic_2 = Mechanic.create!(name: "Bob", years_experience: 30)  
  end  
  # User story 1  
  it 'shows mechanic attributes' do
  end  
  
  it 'shows average years of experience' do
  end
end