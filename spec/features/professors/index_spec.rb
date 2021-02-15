require 'rails_helper'

RSpec.describe 'As a Visitor' do
  before :each do
  	# @application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
   #  @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
   #  @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
   @professor_1 = Professor.create!(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
   @student_1 = Student.create!(name: "Neville Shortbottom",age: 22)
   @professor_1.students << @student_1
  end

  describe'a professors index page'do
    it'displays the names of professors'do
      visit "/professors"

      within("#professor-#{@professor_1.id}")do
        expect(page).to have_content("#{@professor_1.name}")
        expect(page).to have_link(href: "/professors/#{@professor_1.id}/edit")
        click_link("Update #{@professor_1.name}")
      end

      fill_in("name", with: "Nimvera")
      fill_in("age", with: 315)
      fill_in("specialty", with: "Potions")
      click_button("Update #{@professor_1.name}")

      expect(current_path).to eq("/professors")

      within("#professor-#{@professor_1.id}")do
        expect(page).to have_content("Nimvera")
      end
    end

    it'displays students of a professor'do
      visit "/professors/#{@professor_1.id}"
      within("##{@professor_1.id}s-students") do
        expect(page).to have_content(@student_1.name)
      end
    end
	end

end