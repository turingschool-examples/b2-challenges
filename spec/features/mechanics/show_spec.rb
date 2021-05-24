require 'rails_helper'

RSpec.describe 'mechanic show page', type: :feature do
  before :each do
    @kassy = Mechanic.create!(name: "Kassy Cooper", years_experience: 10)
    @huller = @kassy.rides.create!(name: "The Huller", thrill_rating: 7, open: true)
    @carousel = @kassy.rides.create!(name: "Carousel", thrill_rating: 2, open: true)

    @james = Mechanic.create!(name: "James White", years_experience: 21)
    @freefall = @james.rides.create!(name: "The Freefall", thrill_rating: 8, open: false)
    @matterhorn = @james.rides.create!(name: "The Matterhorn", thrill_rating: 5, open: true)

    @brittany = Mechanic.create!(name: "Brittany Counts", years_experience: 15)
    @space_shot = @brittany.rides.create!(name: "Space Shot", thrill_rating: 6, open: false)

    @katie = Mechanic.create!(name: "Katie Parr", years_experience: 22)
    @teacups = @katie.rides.create!(name: "Teacups", thrill_rating: 4, open: true)
    @bungee = @katie.rides.create!(name: "Reverse Bungee", thrill_rating: 10, open: false)
  end

  context 'mechanics and rides' do
    it 'can list a mechanic and their rides' do
      visit "/mechanics/#{@kassy.id}"

      expect(page).to have_content(@kassy.name)
      expect(page).to have_content(@kassy.years_experience)
      expect(page).to have_content(@huller.name)
      expect(page).to have_content(@carousel.name)
      expect(page).to_not have_content(@teacups.name)
    end

    it 'can list another mechanic and their rides' do
      visit "/mechanics/#{@katie.id}"

      expect(page).to have_content(@katie.name)
      expect(page).to have_content(@katie.years_experience)
      expect(page).to have_content(@teacups.name)
      expect(page).to have_content(@bungee.name)
      expect(page).to_not have_content(@huller.name)
    end
  end
end
