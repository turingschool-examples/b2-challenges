RSpec.describe "mechanics index page", type: :feature do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'John Doe', years_experience: 5)
  end

  it "can see name and years eaxperience" do
  visit "/mechanics/#{@mechanic_1.id}"

  expect(page).to have_content(@mechanic_1.name)
  expect(page).to have_content(@mechanic_1.years_experience)
end


end
