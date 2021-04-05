require 'rails_helper'

RSpec.describe 'Mechanics Index' do
  before :each do
    Mechanic.destroy_all
    Ride.destroy_all
    @kara = Mechanic.create!(name: 'Kara Smith', years_of_experience: 11)
    @alex = Mechanic.create!(name: 'Alex Potter', years_of_experience: 17)
    @brian = Mechanic.create!(name: 'Brian Simpson', years_of_experience: 2)
    
    @the_hurler = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    @spider_man = Ride.create!(name: 'Spider Man', thrill_rating: 9, open: true)
    @twin_dragons = Ride.create!(name: 'Twin Dragons', thrill_rating: 10, open: true)

    @Ride_Mechanic_1 = RideMechanics.create!(mechanic: @kara, ride: @the_hurler)
    @Ride_Mechanic_2 = RideMechanics.create!(mechanic: @kara, ride: @twin_dragons)
    @Ride_Mechanic_3 = RideMechanics.create!(mechanic: @alex, ride: @the_hurler)
    @Ride_Mechanic_4 = RideMechanics.create!(mechanic: @brian, ride: @the_hurler)
    @Ride_Mechanic_5 = RideMechanics.create!(mechanic: @brian, ride: @spider_man)
    @Ride_Mechanic_5 = RideMechanics.create!(mechanic: @brian, ride: @twin_dragons)
  end

  it 'shows all mechanics name and their years of experience' do
    visit '/artists'

    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_of_experience)
    expect(page).to have_content(@alex.name)
    expect(page).to have_content(@alex.years_of_experience)
    expect(page).to have_content(@brian.name)
    expect(page).to have_content(@brian.years_of_experience)
    expect(page).to have_content(@mechanics.average_years_of_experience)
  end
end
