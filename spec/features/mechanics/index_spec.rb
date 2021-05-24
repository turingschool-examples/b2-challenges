require 'rails_helper'

describe 'mechanics index' do
  before :each do
    @tim = Mechanic.create!(name:'Tim', experience: 12)
    @jim = Mechanic.create!(name:'Jim', experience: 16)
    @bim = Mechanic.create!(name:'Bim', experience: 8)
    @fim = Mechanic.create!(name:'Fim', experience: 4)
    visit '/mechanics'
  end
  it 'has a header' do
    expect(page).to have_content('All Mechanics')
  end

  it 'displays mechanic name and experience' do
    expect(page).to have_content('Mechanic name: Tim')
    expect(page).to have_content('Mechanic experience: 12 years')
  end

  it 'displays average mechanic experience' do
    expect(page).to have_content('On Average, Our Mechanics Have 10.0 Years of Experience')
  end

end