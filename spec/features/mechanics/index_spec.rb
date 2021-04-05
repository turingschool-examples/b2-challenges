require "rails_helper"
RSpec.describe "When I visit mechanics index" do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Olafur', years_experience: 5)
	@mechanic_2 = Mechanic.create!(name: 'Kristjan', years_experience: 10)
	@mechanic_3 = Mechanic.create!(name: 'Hildur', years_experience: 15)
	@mechanic_4 = Mechanic.create!(name: 'Arni', years_experience: 20)
  end

 describe "I can read 'All Mechanics'" do
    it "Lists mechanics names/experience/average experience" do

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.years_experience)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to have_content(@mechanic_3.years_experience)
      expect(page).to have_content(@mechanic_4.name)
      expect(page).to have_content(@mechanic_4.years_experience)
      expect(page).to have_content("Average years of experience: 12.5")
    end
  end
end