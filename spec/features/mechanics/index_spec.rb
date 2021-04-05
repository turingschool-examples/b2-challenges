RSpec.describe "courses index page", type: :feature do
  before :each do
    @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'John Doe', years_experience: 5)
  end

  it "can see a list of mechanics names and years_experience" do
    visit "/mechanics"

    save_and_open_page

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@mechanic_2.name)
    expect(page).to have_content(@mechanic_2.years_experience)
  end
end
