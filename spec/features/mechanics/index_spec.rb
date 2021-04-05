require "rails_helper"

RSpec.describe 'Mechanics Index' do
  before :each do
    @josie = Mechanic.create!(name: 'Josie', years_of_experience: 3)
    @emmy = Mechanic.create!(name: 'Emmy', years_of_experience: 5)
    @bella = Mechanic.create!(name: 'Bella', years_of_experience: 1)
  end

  it 'shows all mechanic names and years of experience' do
    visit '/mechanics'

    expect(page).to have_content(@josie.name)
    expect(page).to have_content(@josie.years_of_experience)
    expect(page).to have_content(@emmy.name)
    expect(page).to have_content(@emmy.years_of_experience)
    expect(page).to have_content(@bella.name)
    expect(page).to have_content(@bella.years_of_experience)
  end

end
