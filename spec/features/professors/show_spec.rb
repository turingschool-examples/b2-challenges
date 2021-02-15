require 'rails_helper'

RSpec.describe 'As a Visitor' do
  before :each do
  	# @application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
   #  @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
   #  @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
   @professor_1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
  end

  describe'I can visit a professors show page'do
  	it'displays the information about a professor'do
  		visit "/professors/#{@professor_1.id}"

  		within("#shown-prof")do
  			expect(page).to have_content("#{@professor_1.name}")
  			expect(page).to have_content("#{@professor_1.age}")
  			expect(page).to have_content("#{@professor_1.specialty}")
  		end
  	end
	end

end